Received: from einhorn.in-berlin.de ([192.109.42.8] ident=root)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PcxWX-0005zb-EJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 11:01:49 +0100
X-Envelope-From: sledz@dresearch.de
X-Envelope-To: <openembedded-devel@lists.openembedded.org>
Received: from mobil-400-586.intern.dresearch.de
	(p57A22740.dip0.t-ipconnect.de [87.162.39.64]) (authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p0CA1IbJ006476
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 11:01:18 +0100
Received: from mobil-400-586.intern.dresearch.de (localhost [IPv6:::1])
	by mobil-400-586.intern.dresearch.de (Postfix) with ESMTP id 253B224A33
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 11:01:16 +0100 (CET)
Message-ID: <4D2D7BEB.8080706@dresearch.de>
Date: Wed, 12 Jan 2011 11:01:15 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Lightning/1.0b1
	Thunderbird/3.0.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D2C00E7.2010807@dresearch.de>
In-Reply-To: <4D2C00E7.2010807@dresearch.de>
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
Subject: Re: epiphany still broken
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
X-List-Received-Date: Wed, 12 Jan 2011 10:01:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/11/2011 08:04 AM, Steffen Sledz wrote:
> I'm back to OE after two month and do_configure for epiphany-2.30.2
> still fails [1]. :(
> 
> As mentioned in earlier threads[2] i'll push my original patch which
> disables the ca-file use [3], if nobody can fix this in the next days.
> 
> Steffen
> 
> [1] <http://tinderbox.openembedded.org/packages/1591919/>
> [2] <http://thread.gmane.org/gmane.comp.handhelds.openembedded/38251/focus=38830>
> [3] <http://thread.gmane.org/gmane.comp.handhelds.openembedded/37453/focus=37585>

I'll resend my original patch to bring it to patchwork.

Steffen


