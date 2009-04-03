Received: from [130.89.2.13] (helo=mx.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <k.kooi@student.utwente.nl>) id 1LpncJ-0003nE-Q8
	for openembedded-devel@openembedded.org; Fri, 03 Apr 2009 19:55:55 +0200
Received: from [172.20.1.5] (vpn006064.vpn.utwente.nl [130.89.6.64])
	by mx.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id n33Hr9pw015418; 
	Fri, 3 Apr 2009 19:53:09 +0200
Message-Id: <C449F935-2719-4D1B-ACFE-4515E760F704@student.utwente.nl>
From: Koen Kooi <k.kooi@student.utwente.nl>
To: Otavio Salvador <otavio@ossystems.com.br>
In-Reply-To: <be7a9f3d0904030534i7d9ea46ar8833a5b83f641d65@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v930.3)
Date: Fri, 3 Apr 2009 19:53:06 +0200
References: <1238532011-2963-1-git-send-email-k.kooi@student.utwente.nl>
	<19c1b8a90903311458k56ee153fkb6977ce7349b78fc@mail.gmail.com>
	<gr2vdb$k2v$2@ger.gmane.org>
	<200904022154.03611.raj.khem@gmail.com>
	<be7a9f3d0904030534i7d9ea46ar8833a5b83f641d65@mail.gmail.com>
X-Pgp-Agent: GPGMail d55 (v55, Leopard)
X-Mailer: Apple Mail (2.930.3)
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-SA-Exim-Connect-IP: 130.89.2.13
X-SA-Exim-Mail-From: k.kooi@student.utwente.nl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,RDNS_NONE autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: [STABLE][PATCH] gcc 4.3.x: disable thumb mode for now, glibc builds don't like it
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
X-List-Received-Date: Fri, 03 Apr 2009 17:55:58 -0000
X-Groupsio-MsgNum: 9056
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="Apple-Mail-6-628465266"
Content-Transfer-Encoding: 7bit

--Apple-Mail-6-628465266
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit


Op 3 apr 2009, om 14:34 heeft Otavio Salvador het volgende geschreven:

> On Fri, Apr 3, 2009 at 1:53 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Thursday 02 April 2009 11:16:10 Koen Kooi wrote:
>>> On 31-03-09 23:58, Khem Raj wrote:
>>>> can you post the error message and commandline or better  
>>>> preprocessed
>>>> file of the error thats happening when compiling libgcc in thumb  
>>>> mode
>>>> plz.
>>>>
>>>> We could try to fix the libgcc problem.
>>>
>>> Any objections to this going into the stable branch till the real  
>>> bug is
>>> fixed?
>>
>> Not from me.
>>
>> Acked-by: Khem Raj  <raj.khem@gmail.com>
>
> From my POV if it is going to stable it needs to go to dev too; even
> if we'll provide a better fix for it later on dev.

Check http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=56ff0ec54b47b82b30fa260d8048a6425e2644c9 
  :)
I only pluck from dev -> stable currently.

regards,

Koen

>
> -- 
> Otavio Salvador                  O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br
>


--Apple-Mail-6-628465266
content-type: application/pgp-signature; x-mac-type=70674453;
	name=PGP.sig
content-description: Dit deel van het bericht is digitaal ondertekend
content-disposition: inline; filename=PGP.sig
content-transfer-encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFJ1k0EMkyGM64RGpERAscJAKCPaYIK14kcFeWoUQLpPz7tsPgjwwCffrDD
sTi44dkAGL1hMDKceQcw7Lc=
=mVhm
-----END PGP SIGNATURE-----

--Apple-Mail-6-628465266--
