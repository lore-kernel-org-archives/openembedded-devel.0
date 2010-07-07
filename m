Received: from mail-dotnet2.eads.net ([80.156.45.105])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1OWTWY-0006OA-C0 for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 14:15:10 +0200
Received: from unknown (HELO de-gate1.mailhub.intra.corp) ([53.154.243.33])
	by mail-dotnet2.eads.net with ESMTP; 07 Jul 2010 14:00:35 +0200
Received: from gateinet1.mail.ds.corp ([149.207.23.241]) by
	de-gate1.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Wed, 7 Jul 2010 14:09:48 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet1.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 7 Jul 2010 14:09:48 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 7 Jul 2010 14:09:49 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA501819C4D@deimsg40.de.net.world>
In-Reply-To: <201007071352.09254.khimov@altell.ru>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Is there a recipe for building and using busybox with
	libbusybox out there ?
Thread-Index: AcsdulqLLUP+yMRxSsmuCbHN4/U+1AAEkj9Q
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA501819C15@deimsg40.de.net.world>
	<201007071352.09254.khimov@altell.ru>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 07 Jul 2010 12:09:48.0749 (UTC)
	FILETIME=[4BCE17D0:01CB1DCD]
X-SA-Exim-Connect-IP: 80.156.45.105
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Is there a recipe for building and using busybox with libbusybox out there ?
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
X-List-Received-Date: Wed, 07 Jul 2010 12:15:11 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="GB2312"
Content-Transfer-Encoding: quoted-printable

Hello Roman I Khimov,

what are your needs to use busybox linked to libbusybox.

What are the advantages/disadvantages in your opinion ?

Regards
Wolfgang Hauser

-----Urspr=A8=B9ngliche Nachricht-----
Von: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-bounces@lists.openembedded.org] Im Auftrag =
von Roman I Khimov
Gesendet: Mittwoch, 7. Juli 2010 11:52
An: openembedded-devel@lists.openembedded.org
Betreff: Re: [oe] Is there a recipe for building and using busybox =
withlibbusybox out there ?

=A7=A3 =A7=E3=A7=E0=A7=E0=A7=D2=A7=EB=A7=D6=A7=DF=A7=DA=A7=DA =
=A7=E0=A7=E4 =A7=B3=A7=E2=A7=D6=A7=D5=A7=D1 07 =A7=DA=A7=F0=A7=DD=A7=F1 =
2010 13:45:25 =A7=D1=A7=D3=A7=E4=A7=E0=A7=E2 Hauser, Wolfgang (external) =

=A7=DF=A7=D1=A7=E1=A7=DA=A7=E3=A7=D1=A7=DD:
> So my question, is somebody working on a recipe for using buysbox this
> way ?

Using it this way locally, will try to prepare a patch for oe.dev today.
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


