Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nr67g-0001Nz-58 for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 09:58:04 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nr64l-0005Bi-Jg for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 09:55:03 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 09:55:03 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 09:55:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 15 Mar 2010 09:53:27 +0100
Message-ID: <hnksi7$k9i$2@dough.gmane.org>
References: <201003081300.19058.holger+oe@freyther.de>	<B6E39224-2467-4EDA-A0F4-94C4F9DAF9CD@vanille-media.de>	<201003081351.35463.holger+oe@freyther.de>
	<201003150446.26284.holger+oe@freyther.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100223 Shredder/3.0.3pre
In-Reply-To: <201003150446.26284.holger+oe@freyther.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: samba-essential upgrade or remove?
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
X-List-Received-Date: Mon, 15 Mar 2010 08:58:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 15-03-10 04:46, Holger Hans Peter Freyther wrote:
> On Monday 08 March 2010 13:51:35 Holger Hans Peter Freyther wrote:
>> On Monday 08 March 2010 13:42:07 Dr. Michael Lauer wrote:
>>> While I'm not using it atm., I recall that samba-essential was the only
>>> recipe that worked relatively painless when Matthias Hentges create it
>>> back then.
>>
>> Then please fix it. You will do a great service to our users. The following
>> CVEs are not addressed:
>> 	CVE-2009-2813, CVE-2009-2948, CVE-2009-2906, CVE-2009-1888,
>> CVE-2008-4314, CVE-2008-1105, CVE-2007-6015, CVS-2007-4572,  CVE-2007-5398,
>> CVE-2007-2444, CVE-2007-2446, CVE-2007-2447, CVE-2007-0452, CVE-2007-0453,
>> CVE-2007-0454, CAN-2006-1059..
> 
> 
> any update? Is anyone volunteering to update samba-essential or shall we 
> remove it from the tree? 

I think samba-essential reason of being can be done in regular samba
recipes by putting some better thought in PACKAGES and FILES. So: delete
this.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLnfWHMkyGM64RGpERAtouAJsHvBK9hBNaAwzz7k1hCa43rfajZACeJ8hc
OyoJWdOnb8+pAvkwoRwLCU4=
=bz/f
-----END PGP SIGNATURE-----



