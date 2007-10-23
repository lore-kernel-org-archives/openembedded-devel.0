Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IkDsj-000856-WB
	for openembedded-devel@openembedded.org; Tue, 23 Oct 2007 09:08:54 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l9N71dUx014712 for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2007 09:01:40 +0200
Message-ID: <471D9C54.3080007@student.utwente.nl>
Date: Tue, 23 Oct 2007 09:01:40 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <20071022033811.GA8050@lenovo>	<471C4DD9.5090707@student.utwente.nl>
	<20071023050142.GA10583@lenovo>
In-Reply-To: <20071023050142.GA10583@lenovo>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: getting started - docbook
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
X-List-Received-Date: Tue, 23 Oct 2007 07:08:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

David Farning schreef:
> On Mon, Oct 22, 2007 at 09:14:33AM +0200, Koen Kooi wrote:
>>> Would you it be useful if I cleaned up the wiki and converted it to
>>> docbook for inclusion in the manual? 
>> Yes! yes! YES!!!!
> 
> Ok, I'll start putting a drop in replacement for the existing getting
> started chapter based on my _limited_ experience, the gettingstarted
> wiki, and questions frequent questions in the users ML.
> 
> Time permitting, I will submit a draft on Monday.  Bob, thanks for the
> offer to proof read and test.
> 
> I am thinking about going through 4 basic steps
> 1. install
> 2. configure
> 3. build
> 4. test
> 
> I would like to use a concrete example that a user can build and
> test on qemu.  Do you have a recommendation for a good machine-distro
> combination that builds well and can show a potential user the capabilities of OE?

the qemuarm, qemux86, spitz and fic-gta01 machines have complete
hardware support in (patched) versions of qemu. DISTRO=angstrom-2007.1
would be the best choice for a distro.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHHZxUMkyGM64RGpERAg+2AJ9bjviltAefV0KEWACE+lLMNH/lwwCePcTP
jU+fXOkDHM7NtC5/BJyvY0k=
=9tJL
-----END PGP SIGNATURE-----


