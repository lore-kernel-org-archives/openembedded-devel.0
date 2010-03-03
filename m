Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NmtAs-0001kZ-C6 for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 19:19:59 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nmt87-0007CG-Uv for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 19:17:07 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Mar 2010 19:17:07 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Mar 2010 19:17:07 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 03 Mar 2010 19:16:50 +0100
Message-ID: <hmm92i$r30$1@dough.gmane.org>
References: <1267633819.4739.343.camel@trini-m4400>	<hmm5pb$est$1@dough.gmane.org>	<1267637587.4739.345.camel@trini-m4400>
	<20100303180851.GC2493@xora-desktop.xora.org.uk>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100223 Shredder/3.0.3pre
In-Reply-To: <20100303180851.GC2493@xora-desktop.xora.org.uk>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Make some big changes right after next stable
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
X-List-Received-Date: Wed, 03 Mar 2010 18:19:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03-03-10 19:08, Graeme Gregory wrote:
> On Wed, Mar 03, 2010 at 10:33:07AM -0700, Tom Rini wrote:
>> Note that I'm not talking about "small" things like removing legacy
>> staging stuff (which is good!) I'm talking about things with the
>> potential to leave stuff non-building until stumbled upon.  Hence the
>> idea we do merge this into dev shortly after the next stable.
>>
> I think you are approaching things backwards.
> 
> Develop this to the point of working enough other people can start to test it
> in a feature branch.
> 
> Tag org.openembedded.dev then merge this work into .dev
> 
> Anyone in the future can use the tag to get back to a "stable" point.

That's what I wanted to say, but Graeme put it way better :)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLjqeSMkyGM64RGpERAmvHAJ4q4v5Ig/lnD2UaW7ffx3R6T1AFdwCeIJcI
bJ9NE/LbnxvZfMzuuvjqAv8=
=rTPS
-----END PGP SIGNATURE-----



