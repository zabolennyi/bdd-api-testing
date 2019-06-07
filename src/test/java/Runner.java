import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.junit4.Karate;
import org.junit.Test;
import org.junit.runner.RunWith;

import static org.junit.Assert.assertTrue;

@RunWith(Karate.class)
@KarateOptions(tags = { "@regression" })
public class Runner {
    @Test
    public void regressionTests(){
        Results results = com.intuit.karate.Runner.parallel(getClass(), 4, "target/reports");
        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
    }
}