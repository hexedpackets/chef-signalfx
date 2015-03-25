# chef-signalfx
Chef cookbook for mangaging the SignalFX metricproxy.


## Requirements
#### cookbooks
- `golang ~> 1.4`
- `git`

## Attributes

#### signalfx::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>[:signalfx][:directory]</tt></td>
    <td>String</td>
    <td>Home directory for the proxy. The metricproxy binary will be linked here.</td>
    <td><tt>/opt/signalfx</tt></td>
  </tr>
  <tr>
    <td><tt>[:signalfx][:user]</tt></td>
    <td>String</td>
    <td>User to run as. Will be created if it does not exist.</td>
    <td><tt>signalfx</tt></td>
  </tr>
  <tr>
    <td><tt>[:signalfx][:repo]</tt></td>
    <td>String</td>
    <td>Location of the metricproxy repo.</td>
    <td><tt>github.com/signalfx/metricproxy</tt></td>
  </tr>
  <tr>
    <td><tt>[:signalfx][:config_file]</tt></td>
    <td>String</td>
    <td>Path to the configuration file.</td>
    <td><tt>/etc/sfdbconfig.conf</tt></td>
  </tr>
  <tr>
    <td><tt>[:signalfx][:log_dir]</tt></td>
    <td>String</td>
    <td>Directory to log to.</td>
    <td><tt>/var/log/sfproxy</tt></td>
  </tr>
  <tr>
    <td><tt>[:signalfx][:pid_file]</tt></td>
    <td>String</td>
    <td>File to write the PID to.</td>
    <td><tt>/var/run/metricproxy.pid</tt></td>
  </tr>
  <tr>
    <td><tt>[:signalfx][:config][:stats_delay]</tt></td>
    <td>String</td>
    <td>How often to report local stats to signalfx.</td>
    <td><tt>1s</tt></td>
  </tr>
  <tr>
    <td><tt>[:signalfx][:config][:forward]</tt></td>
    <td>Array</td>
    <td>Each item is an object containing a configuration to forward incoming metrics.</td>
    <td></td>
  </tr>
  <tr>
    <td><tt>[:signalfx][:config][:listen]</tt></td>
    <td>Array</td>
    <td>Each item is an object containing a configuration to listen for incoming metrics.</td>
    <td></td>
  </tr>
</table>

## Usage
#### signalfx::default

Just include `signalfx` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[signalfx]"
  ]
}
```
