Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MBAax-0007EF-UD
	for openembedded-devel@openembedded.org; Mon, 01 Jun 2009 18:42:44 +0200
Received: (qmail 19661 invoked from network); 1 Jun 2009 16:33:58 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 1 Jun 2009 09:33:58 -0700
Date: Mon, 1 Jun 2009 09:33:58 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090601163357.GY23842@smtp.west.cox.net>
References: <1243867762-16540-1-git-send-email-marcin@juszkiewicz.com.pl>
	<h00sq7$9mv$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <h00sq7$9mv$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: EP93xx - update of GCC support for this sick CPU/FPU
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
X-List-Received-Date: Mon, 01 Jun 2009 16:42:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 01, 2009 at 05:40:54PM +0200, Koen Kooi wrote:
> On 01-06-09 16:49, Marcin Juszkiewicz wrote:
>> Hi
>>
>> This patchset is taken from http://martinwguy.co.uk/martin/crunch/
>>
>> It is enabled by default for ep93xx devices as EDB9301 boots into rootfs
>> built with this toolchain without problems. Running "openssl speed"
>> works but end table with results contains broken calculations.
>>
>> Binary locales do not work as QEMU do not handle ep93xx cpu.
>>
>> Patches are a bit ugly maybe (in conf/machine/include/*) but I want to
>> show it finally to people before it rust.
>
> maverick *is* ugly :) The patches look OK, so feel free to add my  
> Acked-by to all of them.

Mine too.

-- 
Tom Rini


