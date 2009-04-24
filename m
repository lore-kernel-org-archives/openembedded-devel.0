Received: from [130.89.2.13] (helo=mx.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <k.kooi@student.utwente.nl>) id 1LxGCy-0006p4-BI
	for openembedded-devel@openembedded.org; Fri, 24 Apr 2009 09:52:32 +0200
Received: from [172.20.1.5] (vpn006011.vpn.utwente.nl [130.89.6.11])
	by mx.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id n3O7lKpw019225
	for <openembedded-devel@openembedded.org>;
	Fri, 24 Apr 2009 09:47:20 +0200
Message-Id: <2DE2BF31-0CEB-4FC0-9180-2AF38BDD8861@student.utwente.nl>
From: Koen Kooi <k.kooi@student.utwente.nl>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
In-Reply-To: <20090424073122.GA28636@denix.org>
Mime-Version: 1.0 (Apple Message framework v930.3)
Date: Fri, 24 Apr 2009 09:47:17 +0200
References: <1240558083-13432-1-git-send-email-k.kooi@student.utwente.nl>
	<20090424073122.GA28636@denix.org>
X-Pgp-Agent: GPGMail d55 (v55, Leopard)
X-Mailer: Apple Mail (2.930.3)
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [STABLE][PATCH] udev 124: add cache invalidation logic on	kernel change or its bootargs/cmdline/atags
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
X-List-Received-Date: Fri, 24 Apr 2009 07:52:39 -0000
X-Groupsio-MsgNum: 9725
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="Apple-Mail-2-259032598"
Content-Transfer-Encoding: 7bit

--Apple-Mail-2-259032598
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit


Op 24 apr 2009, om 09:31 heeft Denys Dmytriyenko het volgende  
geschreven:

> On Fri, Apr 24, 2009 at 09:28:03AM +0200, Koen Kooi wrote:
>> From: Denys Dmytriyenko <denis@denix.org>
>>
>> also add /etc/default/udev with the option to disable device caching
>>
>> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
>> Acked-by: Tom Rini <trini@embeddedalley.com>
>> Acked-by: Koen Kooi <koen@openembedded.org>
>> Signed-off-by: Koen Kooi <koen@openembedded.org>
>
> Can/should I ack my own patch? :)

I was wondering about the same, since 3 stable maintainers already  
approved the patch going into .dev. Do you want to push this into  
stable?

regards,

Koen

--Apple-Mail-2-259032598
content-type: application/pgp-signature; x-mac-type=70674453;
	name=PGP.sig
content-description: Dit deel van het bericht is digitaal ondertekend
content-disposition: inline; filename=PGP.sig
content-transfer-encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFJ8W6HMkyGM64RGpERAsGWAKCmQAyJhAqXfPadJtl/pevS5VYA3ACgrYRG
c/Lun4ir3K7Xk/NgzAJFRk0=
=JibY
-----END PGP SIGNATURE-----

--Apple-Mail-2-259032598--
