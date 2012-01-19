Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RnteJ-00071a-AB for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jan 2012 16:11:35 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RntWv-0006Ng-7Q for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jan 2012 16:03:57 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2012 16:03:57 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2012 16:03:57 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 19 Jan 2012 16:03:40 +0100
Message-ID: <jf9bcc$20u$1@dough.gmane.org>
References: <1326731540-15786-1-git-send-email-schnitzeltony@gmx.de>
	<201201191432.30260.schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <201201191432.30260.schnitzeltony@gmx.de>
X-Enigmail-Version: 1.3.4
Subject: Re: [meta-gnome] evince: add cross-compile-fix.patch from classic oe to fix build error
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
X-List-Received-Date: Thu, 19 Jan 2012 15:11:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 19-01-12 14:32, Andreas Müller schreef:
> On Monday, January 16, 2012 05:32:20 PM Andreas Müller wrote:
>> error message was
>> 
>> | warning: failed to load external entity |
>> "/usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl" cannot parse |
>> /usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl | warning: failed to
>> load external entity |
>> "/usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl" cannot parse |
>> /usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl | make[2]: ***
>> [evince-C.omf] Error 1
>> 
>> [1] 
>> http://cgit.openembedded.org/openembedded/tree/recipes/evince/evince/cross
>>
>> 
- -compile-fix.patch
>> 
>> Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
> ping

It's queued, I'll push it later this week.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk8YMMgACgkQMkyGM64RGpFuLQCfdyhONhBnG3+YaV+fLfD2qnBv
cgQAoJwtF8oSwrBnIBFouxTTXebNf+R7
=N1X8
-----END PGP SIGNATURE-----



