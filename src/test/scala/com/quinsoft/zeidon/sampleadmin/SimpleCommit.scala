package com.quinsoft.zeidon.sampleadmin

import com.quinsoft.zeidon.scala.ObjectEngine
import com.quinsoft.zeidon.scala.View

object SimpleCommit {

  def main(args: Array[String]) {
    // Create Zeidon Object Engine.  This will load configuration values from the
    // first zeidon.ini in the classpath.
    val oe = ObjectEngine.getInstance
    
    // Create a task for SampleAdmin application.
    val task = oe.createTask( "SampleAdminApp" )

    // Create an empty OI.
    val prof = new View( task ) basedOn( "Professor" ) activateEmpty
    
    // Create a Professor entity. 
    prof.Professor create()
    
    // Set the professor's name to Jim
    prof.Professor.Name = "Jim"
    
    prof commit()
  }

}