Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MBFG0-0001zQ-Rl
	for openembedded-devel@openembedded.org; Mon, 01 Jun 2009 23:41:26 +0200
Received: (qmail 20747 invoked from network); 1 Jun 2009 21:32:37 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 1 Jun 2009 14:32:37 -0700
Date: Mon, 1 Jun 2009 14:32:37 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090601213236.GE26065@smtp.west.cox.net>
References: <gr7nfd$32a$1@ger.gmane.org>
	<20090601165809.GZ23842@smtp.west.cox.net>
	<h012tn$v40$1@ger.gmane.org>
	<1243887426.5049.18.camel@lenovo.internal.reciva.com>
	<h01f1l$7t1$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <h01f1l$7t1$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [RFC] Rebuild external kernel modules on kernel change
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
X-List-Received-Date: Mon, 01 Jun 2009 21:41:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 01, 2009 at 10:52:04PM +0200, Koen Kooi wrote:
> On 01-06-09 22:17, Phil Blundell wrote:
>  Then, your kernel package could
>> Provide: kernel-abi-123456abc, all your module packages could Depend: on
>> the same thing, and (modulo a little bit of package manager tweaking
>> along roughly the same lines as we use for locales) everything would
>> "just work".
>
> only if you use {o,i}pkg, which isn't good enough.

Similar stuff should be doable for deb and rpm.

-- 
Tom Rini


