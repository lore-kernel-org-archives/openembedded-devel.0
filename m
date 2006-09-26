Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GSDR1-0006P8-4V
	for openembedded-devel@openembedded.org; Tue, 26 Sep 2006 15:57:19 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k8QDqSfd019450 for <openembedded-devel@openembedded.org>;
	Tue, 26 Sep 2006 15:52:28 +0200
Message-ID: <4519309D.7050602@dominion.kabel.utwente.nl>
Date: Tue, 26 Sep 2006 15:52:29 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.7 (Macintosh/20060909)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
References: <4518B426.6070905@mitac-mtc.com.tw>	<1159265456.18705.53.camel@gandalf.tm.informatik.uni-frankfurt.de>	<4519283E.5010001@dominion.kabel.utwente.nl>
	<1159277450.5573.67.camel@localhost.localdomain>
In-Reply-To: <1159277450.5573.67.camel@localhost.localdomain>
X-Enigmail-Version: 0.94.1.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Failed to build gpe-image ( mainstone/generic )
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Sep 2006 13:57:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Tue, 2006-09-26 at 15:16 +0200, Koen Kooi wrote:

>> Is anybody still using dbus 0.23.x in .dev? I'd like to move it to packages/obsolete/dbus
>> to avoid people falling in this trap over and over again. D-bus 1.0 (with a stable API) is
>>  going to be released soon(TM), so people should really adapt their apps to the 0.9x (and
>> thus 1.0) API.
> 
> I'd vote for removing it. Nobody should be using that now and if they
> anyone does need it, we have an SCM for a reason...
> 
> One of my builds has also fallen down this hole :-(.

I moved it to packages/obsolete and will remove it later. Do we have a policy on how to
mark stuff obsolete/deprecated? I know the linux people have a file in Documentation that
mark obsolete stuff and the date it'll go away, do we want a similar thing in OE?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFGTCdMkyGM64RGpERAoyvAKC3CPXvfm5Pn4Qsn1ME//+QdCuobACgja7Q
T7zsRtAaJewYvFSGPD+gCfI=
=crsQ
-----END PGP SIGNATURE-----


