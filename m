Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id BD16460702
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 23:27:24 +0000 (UTC)
Received: (qmail 9712 invoked by uid 1003); 25 Jun 2014 23:27:25 -0000
Received: from unknown (HELO ?10.16.32.86?) (philip@opensdr.com@64.186.172.226)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	25 Jun 2014 23:27:24 -0000
Message-ID: <53AB5ADB.3080403@balister.org>
Date: Wed, 25 Jun 2014 16:27:23 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <53AA0672.7070606@balister.org>	<2894594.Bns9GHPWX5@peggleto-mobl5.ger.corp.intel.com>	<53AB1718.7000608@balister.org>
	<20140625185504.GD1580@denix.org>
	<CAMCfZKEOYwA=9CtEVVccXASOJXHsh5agvPWvG6imOJXXCEv8Zw@mail.gmail.com>
In-Reply-To: <CAMCfZKEOYwA=9CtEVVccXASOJXHsh5agvPWvG6imOJXXCEv8Zw@mail.gmail.com>
X-Enigmail-Version: 1.6
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: State of the art for creating an image that you can dd to an SD card
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
X-List-Received-Date: Wed, 25 Jun 2014 23:27:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 06/25/2014 04:13 PM, Diego Sueiro wrote:
> Hi Denys,
> 
> On Wed, Jun 25, 2014 at 3:55 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> 
>> http://cgit.openembedded.org/openembedded-core/tree/scripts/wic
>>
>> But indeed, better documentation would be most appreciated.
> 
> 
> I didn't have a chance to take a look and test wic tool.
> Do you know if it can be used to generate sdcard images for TI's Sitara
> SoCs?
> The _problem_ for creating a sdcard image for Sitara is the configuration
> of Heads, Sectors and Cylinders that should be passed to sfdisk and needs
> to be done as root.

This isn't true.

https://groups.google.com/forum/#!topic/beagleboard/ro5k5r4Cuq4

I've avoided the CHS business for ages and haven't had trouble booting.

Philip

> 
> 
> Regards,
> 
> --
> *dS
> Diego Sueiro
> 
> Administrador do Embarcados
> www.embarcados.com.br
> <http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>
> 
> /*long live rock 'n roll*/
> 

