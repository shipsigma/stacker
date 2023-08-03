<h1 align="center">
  <img src="https://github.com/shipsigma/stacker/assets/11765848/97d1d1cc-33b4-42d5-a78c-01e067dcc411" width=200 alt=""><br>
  stacker<br>
</h1>

Stacker creates a Cloudformation Stack solely to use the Output or Export function for Terraform values. This allows you to use Terraform for the bulk of your infrastructure, but use Cloudformation stacks for legacy inputs or Serverless stacks. From the Cloudformation stack, you can use the `!ImportValue` function to retreive the necessary value.

Since Cloudformation does not allow creating a stack without at least a single resource - to get around this, we create a custom `NullResource` in the Stack that uses a falsey condition, effectively creating a no-op. This will not sanatize input, and fail if an unsupported character is passed in.

## Usage

```tf
module "stack-outputs" {

  source = "github.com/shipsigma/stacker"

  name = "cloudformation-stack-name"
  outputs = {
    route53ZoneId = {
      Value       = data.aws_route53_zone.main.id
      Description = "Main Route53 Zone ID"
      Export = {
        Name = "route53:main:id"
      }
    }
  }
}
```
