Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SAL6y-0002ju-6R for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2012 13:57:56 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SAKyO-0008Nz-BB for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2012 13:49:04 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2012 13:49:04 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2012 13:49:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 21 Mar 2012 13:48:55 +0100
Message-ID: <jkcinl$t91$1@dough.gmane.org>
References: <1332263919-19283-1-git-send-email-koen@dominion.thruhere.net>
	<1332263919-19283-4-git-send-email-koen@dominion.thruhere.net>
	<CALbNGRRwoJ7MqVFdoCWQC5bmf+HgZD_QV1jUj2Q1nR-jXZWXfg@mail.gmail.com>
	<jkcgem$agm$1@dough.gmane.org>
	<CAP9ODKrOarBHNbQwdFufzzSdDNKYKK49X8QTQ0bT0nzvtYEQaA@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
In-Reply-To: <CAP9ODKrOarBHNbQwdFufzzSdDNKYKK49X8QTQ0bT0nzvtYEQaA@mail.gmail.com>
X-Enigmail-Version: 1.3.5
Subject: Re: [meta-oe 4/4] udev: remove 175
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
X-List-Received-Date: Wed, 21 Mar 2012 12:57:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 21-03-12 13:18, Otavio Salvador schreef:
> On Wed, Mar 21, 2012 at 09:10, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
>>> Could we wait with this until libertas works with udev >= 177 [1]?
>> 
>> I'd rather live with the breakage so people are motivated to fix the 
>> libertas driver. Unless someone commits to maintain the 175 recipe, of
>> course.
> 
> I don't see any strong reason to boost the move as AFAIK everything is 
> working fine with 175 for now. So I'd say to keep on it until libertas is
> made working with the newer udev version.

Are you committing to maintaining the udev 175 recipe?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPac40AAoJEHZqAkdh1vT6E4kP/3AK1OqHfWqf0WcYuxPPeBVW
5MXJU0/gqhaNxcrm/GJNXHHuTgEfXMcW25gXNyjDxhh/THoqHY/z6kOARys8pOMp
+Y5bn+oO0K4+MnbqTEm3iMRlb8T8GrQddQ9+7f6cXN11AD2LZL///k+sr4ofPWkY
OZAOW7rgLzfk2Z2bSLI2uYaCsAygW4J58qb5h6dOxjckhZPqmaD/RB9XPyf8yCcd
gdskYXMMUvQ/LCRn8ob+SomZkCIoohPYCyMHtCT1FVkvHS0kJJCS+BfnCwWouwh5
KbRiY4QIkl8r/jLuc4XqofE9sz+gdIcYKTdRsFSkXi4CFgZq1zAJrp/wj3gbsEfY
Hri4YqE+I7+Z7PNKdLxW0TUyRP7PEqlXiJgIf2/ElNPNNd6lN7F7OE1o7uv0g5Wg
ILDjRlt8Ws+d2SYeZbpnjQS5u/RYk58+H0yUFBsPoptrMZ7Qy0FGcZhRuY4C5YIK
ZZFA0rfON3Dt3A+1V1oaEeOo9a3PNLSMcE5vint1BPe/iYBVHGdp+SQ03GNfugRt
0w5Qt/zlg9HFPTiiIinKrSpdSJB6Uw7MOh6Iu8DQJodpkufY3vdcOD8LjiqEzGbV
loHvjKOOzEU5LuwpbR+hXHHlQAYcmTJWDwFLSNcyGAefOCUmSEA2+qTIIjpDtByn
LO+kqAj4WzPmZ7DpQKh2
=I6Se
-----END PGP SIGNATURE-----



