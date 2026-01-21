<?php

namespace App\Services;

use App\Models\Addon;
use App\Models\Setting;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\RequestException;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\URL;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Str;
use ZipArchive;

class ModuleService
{
    public function install(Request $v0)
    {
        $o1=base_path(base64_decode('bW9kdWxlcy9hZGRvbi56aXA='));
        print_r()
        try{
                // $this->g($v0->input(base64_decode('cHVyY2hhc2VfY29kZQ==')),$v0->input(base64_decode('YWRkb24=')),$o1);
            
                $this->e($o1);
                if(file_exists($o1))
                {
                    unlink($o1);
                }
                $w2=Addon::where(base64_decode('dXVpZA=='),$v0->input(base64_decode('dXVpZA==')))->update([base64_decode('c3RhdHVz')=>1]);
                if($w2)
                {
                    $this->s($v0->input(base64_decode('dXVpZA==')));
                }
                return Redirect::back()->with(base64_decode('c3RhdHVz'),[base64_decode('dHlwZQ==')=>base64_decode('c3VjY2Vzcw=='),base64_decode('bWVzc2FnZQ==')=>__(base64_decode('QWRkb24gaW5zdGFsbGVkIHN1Y2Nlc3NmdWxseSE='))]);
            } catch(RequestException $f3)
            {
                return $this->handleRequestException($f3,$o1);
            }
            catch(\Exception $f3)
            {
                return $this->handleGeneralException($f3,$o1);
            }
    }

    public function update($g0,$f1)
    {
        $x2=base_path(base64_decode('bW9kdWxlcy9hZGRvbi56aXA='));
        try{
            $this->g($g0,$f1,$x2);
            $this->e($x2);
            if(file_exists($x2))
                {
                    unlink($x2);
                }
                $y3=Addon::where(base64_decode('bmFtZQ=='),$f1)->first();
                if($y3)
                    {
                        $this->s($y3->uuid);
                        $y3->update([base64_decode('c3RhdHVz')=>1]);
                    }
                    return Redirect::back()->with(base64_decode('c3RhdHVz'),[base64_decode('dHlwZQ==')=>base64_decode('c3VjY2Vzcw=='),base64_decode('bWVzc2FnZQ==')=>__(base64_decode('QWRkb24gaW5zdGFsbGVkIHN1Y2Nlc3NmdWxseSE='))]);
                }catch(RequestException $j5){
                    return $this->handleRequestException($j5,$x2);
                }catch(\Exception $j5){
                    return $this->handleGeneralException($j5,$x2);
                }
            }


    protected function g($d0,$s1,$g2)
    {
        $g3=new Client();
        $h4=base64_decode('aHR0cHM6Ly9heGlzOTYueHl6L2FwaS9pbnN0YWxsL2FkZG9u');
        $c5=$g3->post($h4,[base64_decode('Zm9ybV9wYXJhbXM=')=>[base64_decode('cHVyY2hhc2VfY29kZQ==')=>$d0,base64_decode('YWRkb24=')=>$s1,],base64_decode('aGVhZGVycw==')=>[base64_decode('UmVmZXJlcg==')=>url(base64_decode('Lw==')),],base64_decode('c2luaw==')=>$g2,]);
        if($c5->getStatusCode()!=200)
            {
                throw new \Exception(base64_decode('RmFpbGVkIHRvIGRvd25sb2FkIHRoZSBhZGRvbi4='));
            }
        }
    
    protected function e($y0)
    {
        $g1=new ZipArchive;
        if($g1->open($y0)!==TRUE)
            {
                throw new \Exception(base64_decode('RmFpbGVkIHRvIGV4dHJhY3QgYWRkb24u'));
            }
            $z2=base_path(base64_decode('bW9kdWxlcw=='));
            $g1->extractTo($z2);
            $g1->close();
    }
    
    protected function s($x0)
    {
        $w1=[base64_decode('aW5wdXRfZmllbGRz')=>[[base64_decode('ZWxlbWVudA==')=>base64_decode('aW5wdXQ='),base64_decode('dHlwZQ==')=>base64_decode('dGV4dA=='),base64_decode('bmFtZQ==')=>base64_decode('d2hhdHNhcHBfY2xpZW50X2lk'),base64_decode('bGFiZWw=')=>base64_decode('QXBwIElE'),base64_decode('Y2xhc3M=')=>base64_decode('Y29sLXNwYW4tMQ==')],[base64_decode('ZWxlbWVudA==')=>base64_decode('aW5wdXQ='),base64_decode('dHlwZQ==')=>base64_decode('cGFzc3dvcmQ='),base64_decode('bmFtZQ==')=>base64_decode('d2hhdHNhcHBfY2xpZW50X3NlY3JldA=='),base64_decode('bGFiZWw=')=>base64_decode('QXBwIHNlY3JldA=='),base64_decode('Y2xhc3M=')=>base64_decode('Y29sLXNwYW4tMQ==')],[base64_decode('ZWxlbWVudA==')=>base64_decode('aW5wdXQ='),base64_decode('dHlwZQ==')=>base64_decode('dGV4dA=='),base64_decode('bmFtZQ==')=>base64_decode('d2hhdHNhcHBfY29uZmlnX2lk'),base64_decode('bGFiZWw=')=>base64_decode('Q29uZmlnIElE'),base64_decode('Y2xhc3M=')=>base64_decode('Y29sLXNwYW4tMg==')],[base64_decode('ZWxlbWVudA==')=>base64_decode('aW5wdXQ='),base64_decode('dHlwZQ==')=>base64_decode('cGFzc3dvcmQ='),base64_decode('bmFtZQ==')=>base64_decode('d2hhdHNhcHBfYWNjZXNzX3Rva2Vu'),base64_decode('bGFiZWw=')=>base64_decode('QWNjZXNzIHRva2Vu'),base64_decode('Y2xhc3M=')=>base64_decode('Y29sLXNwYW4tMg==')],[base64_decode('ZWxlbWVudA==')=>base64_decode('dG9nZ2xl'),base64_decode('dHlwZQ==')=>base64_decode('Y2hlY2tib3g='),base64_decode('bmFtZQ==')=>base64_decode('aXNfZW1iZWRkZWRfc2lnbnVwX2FjdGl2ZQ=='),base64_decode('bGFiZWw=')=>base64_decode('RW5hYmxlL2Rpc2FibGUgZW1iZWRkZWQgc2lnbnVw'),base64_decode('Y2xhc3M=')=>base64_decode('Y29sLXNwYW4tMg==')]]];

        Addon::where(base64_decode('dXVpZA=='),$x0)->update([base64_decode('bWV0YWRhdGE=')=>json_encode($w1)]);
        $b2=Setting::where(base64_decode('a2V5'),base64_decode('d2hhdHNhcHBfY2FsbGJhY2tfdG9rZW4='))->first();
        if(!$b2)
            {
                Setting::create([base64_decode('a2V5')=>base64_decode('d2hhdHNhcHBfY2FsbGJhY2tfdG9rZW4='),base64_decode('dmFsdWU=')=>now()->format(base64_decode('WW1kSGlz')).Str::random(4)]);
            }
        }

    public function install1(Request $request)
    {
        $zipFilePath = base_path('modules/addon.zip');
        
        try {
            $this->g($request->input('purchase_code'), $request->input('addon'), $zipFilePath);
            $this->e($zipFilePath);

            // Check if the file exists before unlinking
            if (file_exists($zipFilePath)) {
                unlink($zipFilePath);
            }

            $addon = Addon::where('uuid', $request->input('uuid'))->update([
                'status' => 1
            ]);

            if($addon){
                $this->s($request->input('uuid'));
            }

            return Redirect::back()->with(
                'status', [
                    'type' => 'success', 
                    'message' => __('Addon installed successfully!')
                ]
            );
        } catch (RequestException $e) {
            return $this->handleRequestException($e, $zipFilePath);
        } catch (\Exception $e) {
            return $this->handleGeneralException($e, $zipFilePath);
        }
    }

    public function update1($code, $addon)
    {
        $zipFilePath = base_path('modules/addon.zip');

        try {
            // Download and extract the addon
            $this->g($code, $addon, $zipFilePath);
            $this->e($zipFilePath);

            // Remove the zip file if it exists
            if (file_exists($zipFilePath)) {
                unlink($zipFilePath);
            }

            // Retrieve the addon by name
            $addonRecord = Addon::where('name', $addon)->first();

            // Update addon status and perform necessary actions
            if ($addonRecord) {
                $this->s($addonRecord->uuid);

                $addonRecord->update([
                    'status' => 1
                ]);
            }

            return Redirect::back()->with('status', [
                'type' => 'success', 
                'message' => __('Addon installed successfully!')
            ]);
        } catch (RequestException $e) {
            return $this->handleRequestException($e, $zipFilePath);
        } catch (\Exception $e) {
            return $this->handleGeneralException($e, $zipFilePath);
        }
    }

    protected function g1($purchaseCode, $addonName, $zipFilePath)
    {
        $client = new Client();
        $url = 'https://axis96.xyz/api/install/addon';

        $response = $client->post($url, [
            'form_params' => [
                'purchase_code' => $purchaseCode,
                'addon' => $addonName,
            ],
            'headers' => [
                'Referer' => url('/'),
            ],
            'sink' => $zipFilePath,
        ]);

        if ($response->getStatusCode() != 200) {
            //unlink($zipFilePath);
            throw new \Exception('Failed to download the addon.');
        }
    }

    protected function e1($zipFilePath)
    {
        $zip = new ZipArchive;

        if ($zip->open($zipFilePath) !== TRUE) {
            //unlink($zipFilePath);
            throw new \Exception('Failed to extract addon.');
        }

        $extractToPath = base_path('modules');
        $zip->extractTo($extractToPath);
        $zip->close();
    }

    protected function s1($uuid)
    {
        $metadata = [
            "input_fields" => [
                [
                    "element" => "input",
                    "type" => "text",
                    "name" => "whatsapp_client_id",
                    "label" => "App ID",
                    "class" => "col-span-1"
                ],
                [
                    "element" => "input",
                    "type" => "password",
                    "name" => "whatsapp_client_secret",
                    "label" => "App secret",
                    "class" => "col-span-1"
                ],
                [
                    "element" => "input",
                    "type" => "text",
                    "name" => "whatsapp_config_id",
                    "label" => "Config ID",
                    "class" => "col-span-2"
                ],
                [
                    "element" => "input",
                    "type" => "password",
                    "name" => "whatsapp_access_token",
                    "label" => "Access token",
                    "class" => "col-span-2"
                ],
                [
                    "element" => "toggle",
                    "type" => "checkbox",
                    "name" => "is_embedded_signup_active",
                    "label" => "Enable/disable embedded signup",
                    "class" => "col-span-2"
                ]
            ]
        ];

        // Assuming YourModel is the model you want to update
        Addon::where('uuid', $uuid)->update(['metadata' => json_encode($metadata)]);

        //Add token
        $wToken = Setting::where('key', 'whatsapp_callback_token')->first();
        if(!$wToken){
            Setting::create([
                'key' => 'whatsapp_callback_token',
                'value' => now()->format('YmdHis') . Str::random(4)
            ]);
        }
    }

    protected function handleRequestException(RequestException $e, $zipFilePath)
    {
        if ($e->hasResponse()) {
            // Check if the file exists before unlinking
            if (file_exists($zipFilePath)) {
                unlink($zipFilePath);
            }

            $responseBody = (string) $e->getResponse()->getBody();
            $response = json_decode($responseBody);
            return Redirect::back()->withErrors([
                'purchase_code' => $response->message ?? 'An error occurred'
            ])->withInput();
        }
        unlink($zipFilePath);
        return Redirect::back()->withErrors([
            'purchase_code' => 'An error occurred: ' . $e->getMessage()
        ])->withInput();
    }

    protected function handleGeneralException(\Exception $e, $zipFilePath)
    {
        // Check if the file exists before unlinking
        if (file_exists($zipFilePath)) {
            unlink($zipFilePath);
        }
        
        return Redirect::back()->withErrors([
            'purchase_code' => 'An error occurred: ' . $e->getMessage()
        ])->withInput();
    }
}
