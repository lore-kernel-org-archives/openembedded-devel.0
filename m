Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tasskjapp@gmail.com>) id 1SUGE4-0001Ol-IN
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 13:47:36 +0200
Received: by lbol5 with SMTP id l5so4057759lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2012 04:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=FzbQIU7gs+2akPALdxXXxefPRyqddImnny8kMDPHAjY=;
	b=BGphiYZZZ14cQECt6Nu0cE9cq1LAlcA1x9Fb6tf79TUosUOaCVi+G6eIWHec/IMNX1
	8RS8X9i3bRZWft7UZe6dcaimoosxePUqaC3xFSy4tqGHYrMrILRp6SZt/W01Ts0m8SIj
	M4JDlFEhur6hoNCx28gocOFFQsc4MS+hP99zQWnP0tIRj8VHC+w6nb4AZwzxwR8VnfDr
	GYXanB8bHUjCFnhaUDgOQM9GzpBib3bQAA0cELPz/zzb5t/vg1KbPqqbz5PQndc5Vvln
	RslixrdLZiw8CrtX8n64EieO+FvcN6sIl10CDuteM0O86Y8RI10wjDvM7GaR+NSAi9Dk
	LUhg==
Received: by 10.152.128.137 with SMTP id no9mr12079680lab.2.1337081856579;
	Tue, 15 May 2012 04:37:36 -0700 (PDT)
Received: from [192.168.0.121] ([84.49.231.147])
	by mx.google.com with ESMTPS id tt8sm28209724lbb.16.2012.05.15.04.37.34
	(version=SSLv3 cipher=OTHER); Tue, 15 May 2012 04:37:35 -0700 (PDT)
Message-ID: <4FB23F7C.1060302@gmail.com>
Date: Tue, 15 May 2012 13:35:24 +0200
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4FB0F450.7050404@gmail.com>
	<CAMKF1spY7bTJYzxHhmrvpGurZTDgciQOC0vFPT5HnvbOEFOdeQ@mail.gmail.com>
In-Reply-To: <CAMKF1spY7bTJYzxHhmrvpGurZTDgciQOC0vFPT5HnvbOEFOdeQ@mail.gmail.com>
Subject: Re: License attributions for a system built with OpenEmbedded.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 May 2012 11:47:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/14/2012 11:24 PM, Khem Raj wrote:
> On Mon, May 14, 2012 at 5:02 AM, Tasslehoff Kjappfot
> <tasskjapp@gmail.com>  wrote:
>> Hi.
>>
>> I have made a rootfs and an SDK with OE-classic. We use the SDK to
>> compile our own application, which links dynamically with some open
>> source libraries.
>>
>> I have listed the LGPL libraries our application uses and linked to
>> http://www.gnu.org/licenses/lgpl.txt, but I don't know how/if to
>> attribute OpenEmbedded. Should I include attributions for every single
>> open source software in the rootfs+SDK, or is it sufficient to say that
>> I have compiled them using OpenEmbedded?
> most part of OE metadata are MIT licensed some parts may be GPL
>
> well while booting you could use OE splash screen instead of your company one :)
I'll see what I can do :)

I've already written that I use OpenEmbedded as a build system, and 
included the MIT license. I also used create_manifest.sh from Arago to 
get a list of everything included in the rootfs. What I really wonder is 
if I must add all that information as well.

I hereby guarantee that I won't take any answers as legal binding advice ;)

- Tasslehoff


