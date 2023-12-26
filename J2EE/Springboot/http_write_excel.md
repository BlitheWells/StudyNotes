#### HTTP接口中输出EXCEL文件
```java
@Slf4j
public class HttpExcelRespUtil {
    public static <T> void writeRespExcel(HttpServletResponse response, List<T> data, String fileName, Class<T> tClass) {
        try (OutputStream outputStream = response.getOutputStream()) {
            Date date = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd-hhmmss");
            String dateStr = df.format(date);
            response.setContentType("application/vnd.ms-excel");
            response.setCharacterEncoding("utf-8");
            fileName = URLEncoder.encode(fileName, "UTF-8");
            response.setHeader("Content-disposition", "attachment;filename=" + fileName + "_" +dateStr + ExcelTypeEnum.XLSX.getValue());
            ExcelWriter excelWriter = EasyExcel.write(outputStream).build();
            WriteSheet writeSheet = EasyExcel.writerSheet(0, "sheet1").head(tClass).build();
            excelWriter.write(data, writeSheet);
            excelWriter.finish();
        } catch (Exception e) {
            log.error("writeExcel catch error", e);
        }
    }
}
```
