import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class VerifySeckillState {

    public static void main(String[] args) throws Exception {
        if (args.length < 5) {
            System.err.println("Usage: VerifySeckillState <jdbcUrl> <username> <password> <voucherId> <expectedStock>");
            System.exit(1);
        }

        String jdbcUrl = args[0];
        String username = args[1];
        String password = args[2];
        long voucherId = Long.parseLong(args[3]);
        int expectedStock = Integer.parseInt(args[4]);

        try (Connection connection = DriverManager.getConnection(jdbcUrl, username, password)) {
            long orderCount = queryLong(connection,
                    "SELECT COUNT(*) FROM tb_voucher_order WHERE voucher_id = ?",
                    voucherId);
            long duplicateUsers = queryLong(connection,
                    "SELECT COUNT(*) FROM (" +
                            "SELECT user_id FROM tb_voucher_order WHERE voucher_id = ? GROUP BY user_id HAVING COUNT(*) > 1" +
                            ") t",
                    voucherId);
            long mysqlStock = queryLong(connection,
                    "SELECT stock FROM tb_seckill_voucher WHERE voucher_id = ?",
                    voucherId);

            System.out.println("voucherId=" + voucherId);
            System.out.println("expectedStock=" + expectedStock);
            System.out.println("orderCount=" + orderCount);
            System.out.println("duplicateUsers=" + duplicateUsers);
            System.out.println("mysqlStock=" + mysqlStock);
        }
    }

    private static long queryLong(Connection connection, String sql, long voucherId) throws Exception {
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, voucherId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getLong(1);
                }
                throw new IllegalStateException("No result for query: " + sql);
            }
        }
    }
}
