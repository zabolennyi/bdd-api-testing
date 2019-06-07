package utils;

import java.rmi.server.UID;
import java.util.UUID;

public class NumberUtils {
    public static int generateUniqueId() {
        UID userId = new UID();
        UUID randomUUID = UUID.randomUUID();
        String str=""+randomUUID;
        int uid=str.hashCode();
        String filterStr=""+uid;
        str=filterStr.replaceAll("-", "");
        return Integer.parseInt(str);
    }

}
