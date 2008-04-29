Received: from [209.85.146.176] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jpaechnatz@gmail.com>) id 1JqwaR-0003Zw-IL
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Apr 2008 22:38:03 +0200
Received: by wa-out-1112.google.com with SMTP id m38so162919waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2008 13:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	bh=yTL9i6gv1azkVYwe+VwxdwHAdwrktJ9ka1V3rz1De9s=;
	b=QOFhzz2YVsWCTKoHrx78xc+TeHNWGWF+Aj/uQlcfSXn70vJT6Ybx53hD2/247CE3mtmhl26IbBDfTS1Ac8C9pgX85ejdrs/iuevTFoo9slRyZSmqi97yphc0T2TwgowDv+CMm6tU5zt8IlbDp2yPN0ygCH2Mk/ZG2vKSZGQYAms=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=f7iIEypk+7JnV9PQM2ioRlSylpvhP6cxzV7j7ZQSXH9arzXZL/COS47fbWcTfqTPtDRETrK6+ttoAlnF5c3GzBxzu26x3r0TxjXJzA145Mev5NzZ6Ce3/BSFIj1EnqdCMwIm0wC3MGwsHRBiH0YhPZsOZJjWUXO92mbVlxtfxMk=
Received: by 10.114.52.1 with SMTP id z1mr8505768waz.62.1209501450566;
	Tue, 29 Apr 2008 13:37:30 -0700 (PDT)
Received: by 10.114.159.12 with HTTP; Tue, 29 Apr 2008 13:37:30 -0700 (PDT)
Message-ID: <8609a9b90804291337m5d580672qb16413c2d675cd1e@mail.gmail.com>
Date: Tue, 29 Apr 2008 22:37:30 +0200
From: "Johannes Paechnatz" <jpaechnatz@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: merge mutiple heads...
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Tue, 29 Apr 2008 20:38:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

hello,

when I try to checkout org.openembedded.dev I get the following error...


mtn: Zweig org.openembedded.dev hat mehrere K=F6pfe:
mtn:   1a467a7ea8dfd7463354c140383975aa0b8b20e8
freyther@openembedded.org 2008-04-25T15:51:39
mtn:   60d4d904e10f8212b1c2242377b31ccc2e29e374
freyther@openembedded.org 2008-04-25T15:03:16
mtn: w=E4hlen Sie einen durch 'mtn checkout -r<id>'
mtn: Fehler: Zweig org.openembedded.dev hat mehrere K=F6pfe

thanks.

joh.
--=20
Johannes Paechnatz

skype: jpaechnatz
skype: +49-(0)671-2098502
jabber/xmpp: jpaechnatz@gmail.com
icq: #22621122

amazon: http://www.amazon.de/exec/obidos/registry/3RJ9V070Z2HR3/ref=3Dwl_em=
_to
Callsign: DO2PJ
Try JT65a: http://jt65.w6cqz.org/


