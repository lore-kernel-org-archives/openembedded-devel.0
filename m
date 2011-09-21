Received: from nm13-vm2.bullet.mail.ne1.yahoo.com ([98.138.91.89])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <juhsis@yahoo.com>) id 1R6O3u-0001VT-Vg
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Sep 2011 16:46:11 +0200
Received: from [98.138.90.50] by nm13.bullet.mail.ne1.yahoo.com with NNFMP;
	21 Sep 2011 14:37:49 -0000
Received: from [98.138.89.171] by tm3.bullet.mail.ne1.yahoo.com with NNFMP;
	21 Sep 2011 14:37:49 -0000
Received: from [127.0.0.1] by omp1027.mail.ne1.yahoo.com with NNFMP;
	21 Sep 2011 14:37:49 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 403272.94783.bm@omp1027.mail.ne1.yahoo.com
Received: (qmail 92684 invoked by uid 60001); 21 Sep 2011 14:37:49 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1316615869; bh=f0TUtVrLmDk1H0mevqwdliLFKhhTvlpOU6x/0iVvvmY=;
	h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=GUlewiKYmPFupijPTuse+3QnPK51yA0Q/lqP04pjpNjOwj2UHxyho7rORv+K5Ju4aH5ZvdX9hcxS1j3DzDAYicoI3hIg0RdBNyBho9yuc5q/vXkAkylUkAB3dXbZc8+pNuxMGMjFbvCuCAv11YYAM2YlnrosSL9EADtDiZw/GQM=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=skvAOxv6gDMB1XXaN5MrJFNAKlMgiFyP4+yRsbdXXoQeI/7ePR95cZ/yViz6gqHn5qFFyslw1M6jqD86kckcE1v4H4vgw9MjtHUkJ96b9Mxc9Tst0a1WsE0hQHnG1huAH+vR3bsBmubFjLCIveHVEnni582h/gW8EhF3oM+Zf6s=;
X-YMail-OSG: aw23X58VM1nxQklk7kg0uWNrYCGSZTgiLeKauuHg32KFz06
	.2EjUGZHB4.9wBU7K1H4wY2ocib.TehyDztJLIEuKxGWe_efdlw01rOaeuny
	xt3zh40vL1vMQ.OalS.2abERvGsAz014z1TNlIv6rkqvBWjRRowTfHiA.Hn5
	uWO31LxOREOqbX8Lfs9henIYqrrh2VA96cxHOpmHRHtmsYpNA5KMrTEPmnBp
	D.ddOBlWYEPjn_A7iqDTa0DyRzOBGT.IXzIIpYbt38XXoagnuhEOFG4FXYar
	9Mddu25iENF905sqg1giOZcbTyhr6h7j.GFHg7uewnS_8PB2LGywf.hHj5mR
	Rt_NN2JEoGDXFUJi.lcUr3h1LbSOLQJd6jwrOiVcZ5.kunxxbcA1p_kdhZ8V
	pjVS85IzOv1A0so6WM3OnxCBsN7yz7DtmE26WOyLh.kSpvoMv760054w0yim
	XmDB2sB0YTpdBHAsS80yHHatVlvMG9kP3MyhyvnIdQ3AWXARPwGzeXlQ3dLr
	5IbLgMj398Q6ytsGSng--
Received: from [95.9.177.49] by web121504.mail.ne1.yahoo.com via HTTP;
	Wed, 21 Sep 2011 07:37:49 PDT
X-Mailer: YahooMailWebService/0.8.114.317681
Message-ID: <1316615869.54346.YahooMailNeo@web121504.mail.ne1.yahoo.com>
Date: Wed, 21 Sep 2011 07:37:49 -0700 (PDT)
From: ibrahim demir <juhsis@yahoo.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: ti_cgt_c6000_6.1.17_setup_linux_x86.bin error while installing ti-codec-engine
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
X-List-Received-Date: Wed, 21 Sep 2011 14:46:11 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Dear developers,


i have a problem at installing ti codec engine:&#65533;http://pastebin.com=
/uU7etDYs&#65533;.&#65533;i downloaded ti_cgt_c6000_6.1.17_setup_linux_x86.=
bin&#65533;and generated it's md5.

in recipes/ti/...6.1.17.bb says md5 is : 41ee41cc74800b06705804f7ef901447.=
 But when i calculate its md5, i get this: 5ee5c8e573ab0a1ba1249511d4a06c27=
. I download again and again but the result of md5 was the same. Then i cha=
nged bb file to 5ee5c8e573ab0a1ba1249511d4a06c27.&#65533;and run bitbake ti=
-codec-engine,&#65533;but the result was:&#65533;http://pastebin.com/1SCrtW=
vQ&#65533;

so in this case what is my problem, what should i do?


Kind Regards,
Ibrahim DEMIR
From paulepanter@users.sourceforge.net Wed Sep 21 16:56:45 2011
Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R6OE9-0001jl-No for openembedded-devel@lists.openembedded.org;
	Wed, 21 Sep 2011 16:56:45 +0200
Received: from f053045060.adsl.alicedsl.de ([78.53.45.60]
	helo
