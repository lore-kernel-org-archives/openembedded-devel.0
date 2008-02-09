Received: from [64.233.166.182] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <xjqian@gmail.com>) id 1JNpJh-0001WX-I1
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Feb 2008 14:00:25 +0100
Received: by py-out-1112.google.com with SMTP id y77so3890330pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Feb 2008 05:00:38 -0800 (PST)
Received: by 10.35.70.17 with SMTP id x17mr15409722pyk.43.1202562038703;
	Sat, 09 Feb 2008 05:00:38 -0800 (PST)
Received: from ?192.168.1.207? ( [24.107.189.117])
	by mx.google.com with ESMTPS id n29sm43564793pyh.41.2008.02.09.05.00.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 09 Feb 2008 05:00:37 -0800 (PST)
Message-ID: <47ADA3F2.1000500@gmail.com>
Date: Sat, 09 Feb 2008 07:00:34 -0600
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1201544344.5882.45.camel@hammer.suse.cz>	<20080130124544.1f562944@widy.localdomain>	<1201695196.27523.52.camel@hammer.suse.cz>
	<47A2D217.7070000@gmail.com> <1202075839.17746.11.camel@utx.utx.cz>
In-Reply-To: <1202075839.17746.11.camel@utx.utx.cz>
Subject: Re: [patch commit request] kdrive xserver:	support	for	key	codes 128-255
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Feb 2008 13:00:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2008 03:57 PM, Stanislav Brabec wrote:
> Junqian Gordon Xu wrote:
>> On 01/30/2008 06:13 AM, Stanislav Brabec wrote:
>>>> Paul Sokolovsky wrote:
>>>> Can you please elaborate what the application of this patch would mean
>>>> for OE (besides fixing support for one specific obscure peripheral)? 
>> I guess I probably would be yelled at for not raising this before 
>> committing your patch.
>>
>> Is this patch specific to Zaurus clamshells, akita/spitz/c7x0? In other 
>> words, are there any other devices benifiting from the extended keycode. 
>>   I vaguely remember Dmitry asked about extended keycode for tosa, but 
>> I'm not sure he's talking about the same thing.
> 
> No. It adds support for key codes 128-255 in general.

I understand this patch is general. But could you educate me that except 
for the Z clamshells, what's the use case for other devices? I guess my 
question is more in line with Paul's challenge. Is this patch just a 
why-not for other devices or something might be helpful?

Regards
Gordon



