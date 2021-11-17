## Packer

Install tool: https://learn.hashicorp.com/tutorials/packer/get-started-install-cli

> See various [authentication methods](https://www.packer.io/docs/builders/azure#authentication-for-azure) for Azure

> [](https://www.packer.io/docs/builders/azure#authentication-for-azure)
Update `packer.json` and run

```
packer validate
packer build -var imgname=agentimage01 -var rgname=test-vmss packer.json
```

Document: https://www.packer.io/docs/builders/azure/arm