Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Ikjsd-0004rC-Lf
	for openembedded-devel@openembedded.org; Wed, 24 Oct 2007 19:18:56 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l9OHBWUo008492 for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Oct 2007 19:11:33 +0200
Message-ID: <471F7CC9.3060904@student.utwente.nl>
Date: Wed, 24 Oct 2007 19:11:37 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <20071024095844.GA9952@lenovo>	<f96d234e0710240401o7fcdae32qc7d43ef162f38744@mail.gmail.com>
	<20071024153620.GA6691@lenovo>
In-Reply-To: <20071024153620.GA6691@lenovo>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [doc] defining OpenEmbedded
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Oct 2007 17:18:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

David Farning schreef:
> On Wed, Oct 24, 2007 at 07:01:30AM -0400, Cliff Brake wrote:
>> On 10/24/07, David Farning <dfarning@gmail.com> wrote:
>>> Getting started is coming along nicely.
>> Great!
>>
>>> In the second case referring to OE as a collection of metadata is
>>> confusing.  Metadata is data about the data.  OE is actually a
>>> collection of patches, task lists, and configuration files.  I was
>>> wondering if it would be more clear to refer to oe as either a ruleset
>>> or task lists.
>> The term metadistribution seems to be somewhat accepted:
>> http://gentoo-wiki.com/Metadistribution
>>
>> In the most basic sense, a bitbake recipe is data about data (the
>> source that needs built), so I think the term fits. Just my opinion.
> 
> I like metadistribution.  Metadistribution is a term referring to an
> adaptable system that is capable of building itself to the user's
> specification.

The reason we tend to avoid the term 'distribution' is because OE is
cabable of building multiple distributions (you could make OE build a
1:1 copy of the fedora install DVD if you want), instead of building
only a single distro for multiple archs.
I agree metadistro covers what OE is, but it is also the most confusing
name to people unfamiliar with OE.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHH3zJMkyGM64RGpERAtoaAJ4lXq5RC0FYVieAWP9O8nrQHnmtBgCgubME
QNzwmMEMBP3we92c5HFoogA=
=ni1H
-----END PGP SIGNATURE-----


