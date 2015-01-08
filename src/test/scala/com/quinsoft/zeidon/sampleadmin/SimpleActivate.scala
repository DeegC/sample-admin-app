/**
 *
 */
package com.quinsoft.zeidon.sampleadmin

import com.quinsoft.zeidon.scala.ObjectEngine
import com.quinsoft.zeidon.scala.View

/**
 * Simplest activate code.
 *
 */
object SimpleActivate {
  
  def main(args: Array[String]) {
    // Create Zeidon Object Engine.  This will load configuration values from the
    // first zeidon.ini in the classpath.
    val oe = ObjectEngine.getInstance
    
    // Create a task for SampleAdmin application.
    val task = oe.createTask( "SampleAdminApp" )

    // Create an empty View based on the Professor LOD.
    val prof = new View( task ) basedOn( "Professor" )
    
    // Activate all professors with Name = "Jim".
    prof.activateWhere( _.Professor.Name = "Jim" )
    
    // Write the results to the log file.
    prof.logObjectInstance
    
  }
  
}