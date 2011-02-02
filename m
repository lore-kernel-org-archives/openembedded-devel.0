Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger+oe@freyther.de>) id 1PkiAn-0000Lb-LL
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Feb 2011 20:15:25 +0100
Received: from [192.168.0.101] (91-64-83-241-dynip.superkabel.de
	[91.64.83.241])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id E2E181B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Feb 2011 19:24:09 +0000 (UTC)
Message-ID: <4D49AD15.4030800@freyther.de>
Date: Wed, 02 Feb 2011 20:14:29 +0100
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D498909.90908@mentor.com>
In-Reply-To: <4D498909.90908@mentor.com>
Subject: Re: qt4*-image and qt 4.6.3?
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
X-List-Received-Date: Wed, 02 Feb 2011 19:15:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02/02/2011 05:40 PM, Tom Rini wrote:
> Hey all,
> 
> Currently none of the qt4*-images build for qt4 4.6.3.  This is because
> building with -xmlpatterns in 4.6.3 isn't viable (it's not a trivial fix to
> enable it, for some reason...) and it's embedded into the image recipes
> themselves in some cases, rather than tasks that can be RRECOMMENDED.  I see
> two courses of action here:

Could you send me the error you get? xmlpatterns should have no external
dependencies... so I wonder how it is failing


