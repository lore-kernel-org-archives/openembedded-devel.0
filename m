Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id AA0156D4BD
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Nov 2013 00:47:39 +0000 (UTC)
Received: (qmail 13130 invoked by uid 1003); 9 Nov 2013 00:47:41 -0000
Received: from unknown (HELO ?10.16.32.54?) (philip@opensdr.com@64.186.172.226)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	9 Nov 2013 00:47:40 -0000
Message-ID: <527D862B.5060500@balister.org>
Date: Fri, 08 Nov 2013 16:47:39 -0800
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <52797DE3.8070203@balister.org> <527A8C4C.3030007@balister.org>
	<90F3F14E-8CB6-4F1B-8C00-215FF84F2EBC@gmail.com>
	<527BE002.30300@balister.org>
In-Reply-To: <527BE002.30300@balister.org>
X-Enigmail-Version: 1.6
Subject: Re: Create meta-sdr
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Nov 2013 00:47:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11/07/2013 10:46 AM, Philip Balister wrote:
> On 11/07/2013 06:43 AM, Khem Raj wrote:
>>
>> On Nov 6, 2013, at 10:37 AM, Philip Balister <philip@balister.org> wrote:
>>
>>> On 11/05/2013 03:23 PM, Philip Balister wrote:
>>>> Based on earlier discussion, we'd like to go ahead and create meta-ssdr
>>>> based on this branch:
>>>>
>>>> https://github.com/balister/meta-oe/commits/meta-sdr
>>>>
>>>> Can someone give me a hand getting this setup in git?
>>>
>>> Or should I take this silence to suggest I should just host this on github?
>>
>> we can host on oe git but I personally like github as well
>> do you just want to make a clone of whatever you have on github ?

After some more thought, I'll put this layer on github, then I can use
the wiki there for some docs. When I have this in pace, I'll send the
rm's for the existing recipes in meta-oe.

Philip

> 
> I'd like to merge what I have into github into meta-oe, then get setup
> so I can push updates to the meta-sdr directory on the meta-oe main server.
> 
> Philip
> 
>>
>>>
>>> Philip
>>>
>>>>
>>>> Thanks,
>>>>
>>>> Philip
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>
>>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> 

