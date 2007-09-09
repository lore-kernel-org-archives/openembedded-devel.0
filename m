Received: from [213.160.40.50] (helo=popeye1.ggamaur.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <roger@bufferoverflow.ch>) id 1IUP8a-0005D2-D8
	for openembedded-devel@openembedded.org; Sun, 09 Sep 2007 17:55:52 +0200
Received: from automat.bufferoverflow.ch (c-82-192-224-61.customer.ggaweb.ch
	[82.192.224.61])
	by popeye1.ggamaur.net (8.13.7/8.13.7/Submit) with ESMTP id
	l89Fqw57061840 for <openembedded-devel@lists.openembedded.org>;
	Sun, 9 Sep 2007 17:53:00 +0200 (CEST)
	(envelope-from roger@bufferoverflow.ch)
Received: by automat.bufferoverflow.ch (Postfix, from userid 33)
	id 3025F4020; Sun,  9 Sep 2007 17:57:14 +0200 (CEST)
Received: from 10.0.0.69 ([10.0.0.69]) by www.bufferoverflow.ch (Horde MIME
	library) with HTTP; Sun, 09 Sep 2007 17:57:14 +0200
Message-ID: <20070909175714.cvxg6cq9icoocggo@www.bufferoverflow.ch>
X-Priority: 3 (Normal)
Date: Sun, 09 Sep 2007 17:57:14 +0200
From: Roger Meier <roger@bufferoverflow.ch>
To: openembedded-devel@openembedded.org
References: <46CF6903.7060703@dominion.kabel.utwente.nl>
	<20070905225908.dcyz0rbxa8wo4ows@www.bufferoverflow.ch>
	<46DFA451.6020006@student.utwente.nl>
	<46E24E51.3080700@student.utwente.nl>
	<46E4027F.107@student.utwente.nl>
In-Reply-To: <46E4027F.107@student.utwente.nl>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) H3 (4.1.3)
X-Scanned-By: MIMEDefang 2.62 on 213.160.40.60
Subject: Re: OE website upgraded to drupal 5.2
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
X-List-Received-Date: Sun, 09 Sep 2007 15:55:52 -0000
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Quoting Koen Kooi <k.kooi@student.utwente.nl>:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Koen Kooi schreef:
>> Koen Kooi schreef:
>>> Roger Meier schreef:
>>>> Hi Koen
>>>> Which drupal and module versions did you use before upgrade?
>>>> There are still some issues with the wiki headings.
>>>> e.g. on page http://www.openembedded.org/wiki/GettingStarted
>>> That is manually inserted html, so probably the content-type for  =20
>>> wiki needs to get
>>> cascaded or we have to patch the markup filter.
>>
>> The correct answer was: "we have to patch the markup sanitizer",  =20
>> which I did :) The wiki
>> works as expected now, the only issue left is the reversed news.
>
> The reversed news issue turned out to be a case of one  =20
> 'db_rewrite_sql()' too many, this
> is fixed now.
Great!

>
> The current TODO:
just drop a line if you need a hand on one of these topics!

>
> * unify tinderbox, viewmtn, org.oe.documentation and main website css
It would be great to have viewmtn integrated into apache webserver.

The URL http://www.openembedded.org:1081/ would not be accessible on =20
every network(e.g. corporate networks)

The following manual describes the way to do this: =20
http://viewmtn.angrygoats.net/revision/file/6971b1ddbf5c30977d1c306f3baa120d=
709d474e/INSTALL

> * make everything conform to standards (xhtml?)
Most drupal sites conform to xhtml.
There are just a few Error's left: =20
http://validator.w3.org/check?verbose=3D1&uri=3Dhttp%3A%2F%2Fwww.openembedde=
d.org%2F

> * get more servers and hosting to spread services


regards,

roger


>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFG5AJ+MkyGM64RGpERApmmAJ0fUkzSK4e4pYvAiLkhV58Aa4O3vACdGrL5
> b+gwB+2P+UuZtp9ywHUCDxI=3D
> =3DBxJz
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>



----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.



