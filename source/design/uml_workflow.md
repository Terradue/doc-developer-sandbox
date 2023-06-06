```{eval-rst}
.. uml::

   !define DIAG_NAME Workflow example

   !include includes/skins.iuml

   skinparam backgroundColor #FFFFFF
   skinparam componentStyle uml2

  start

  :Node A;

  fork
    :Node B;
  fork again
    :Node C;
  end fork
    :Node D;

  stop

  footer
    DIAG_NAME
    endfooter
```
