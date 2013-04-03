Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1UNTj1-00054r-MK
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Apr 2013 21:52:06 +0200
Received: (qmail 31607 invoked by uid 1003); 3 Apr 2013 19:34:51 -0000
Received: from unknown (HELO ?192.168.1.125?)
	(philip@opensdr.com@96.240.165.43)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	3 Apr 2013 19:34:50 -0000
Message-ID: <515C8459.3080005@balister.org>
Date: Wed, 03 Apr 2013 15:34:49 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <515C5DE6.6040702@pseudoterminal.org> <kjhsve$nqm$1@ger.gmane.org>
In-Reply-To: <kjhsve$nqm$1@ger.gmane.org>
X-Enigmail-Version: 1.5.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: New meta-cubox layer
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
X-List-Received-Date: Wed, 03 Apr 2013 19:52:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04/03/2013 02:38 PM, Koen Kooi wrote:
> Op 03-04-13 18:50, Carlos Rafael Giani schreef:
> 
> Just like https://github.com/naguirre/meta-cubox you're mixing
> DISTRO policy in the machine files by setting the tuning to
> hardfloat. Don't do that. If you want hardfloat, set that in your
> distro config, not in your machine config.
> 

This keeps coming up, but I do not see an answer that works for people
creating BSP's that work with just oe-core and a BSP layer.

How are we supposed to set TUNE parameters for this case? And yes,
this case *must* produce useful output.

Philip


> 
> 
> _______________________________________________ Openembedded-devel
> mailing list Openembedded-devel@lists.openembedded.org 
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> 
> 


