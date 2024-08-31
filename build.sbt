//noinspection scala2InSource3
import sbt.*
import sbt.Keys.*

ThisBuild / version := "0.1.0-SNAPSHOT"

ThisBuild / scalaVersion := "2.13.13"

lazy val root = (project in file("."))
  .enablePlugins(WasmComponentPlugin)
  .settings(
    name := "golem-test",
    wasmComponentPackageName := "golem.example"
  )
