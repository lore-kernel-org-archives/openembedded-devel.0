Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PSEbP-0002XI-7k
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 21:02:31 +0100
Received: by yxd5 with SMTP id 5so3568877yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Dec 2010 12:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=lTXWIFGCr4csCL90n/d11+zdTIZVVtxnPOdycmvlxrA=;
	b=Dn7jD+LmXCwCVhf8Mw1NX41mgg1jOlCb7mFEK0D3ri+xCfqL705vB7DtpDzdSYhR9u
	G4D2xGdB370vTJAkEeunVTrT+D+lWNCDIuvl899t/Cy0nZNOKYzpZKMGXuhipk7WqhVq
	GVfaeTUahpmYUkYuNJgrs6yXUh3PR1uXSHIQU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=uO5YoWDc96Z3aiZxWhzu9K1UgfoyX9xn4VhDGa5oEo8kb1L3mvxcNQ2X9TCb7U3Pjn
	B4wrfhrOxMyrtDpPUjR3FGtDmAPhYGZVDPVUOiqhftnG7fanRnPO2JfYlxIgFSZKQust
	42TKZCxRXQJvLjqgTnmhngkTegJ4YP8ynOQDQ=
Received: by 10.91.163.27 with SMTP id q27mr5568416ago.139.1292270454963; Mon,
	13 Dec 2010 12:00:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Mon, 13 Dec 2010 12:00:34 -0800 (PST)
In-Reply-To: <4D065431.6080304@dell.com>
References: <4D065431.6080304@dell.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Dec 2010 12:00:34 -0800
Message-ID: <AANLkTin2DnrgjhA4Qt63+pyfhPP=rLcs94CL_gbOeBGC@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] eglibc: use HTTP for svn checkout
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
X-List-Received-Date: Mon, 13 Dec 2010 20:02:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 13, 2010 at 9:13 AM, Ryan D Phillips
<ryan_d_phillips@dell.com> wrote:
> =C2=A0SVN over HTTP is a more reliable transport for developers behind
> restrictive
> proxies.
>

and how much slower/faster is it when compared to svn protocol ?


> Regards,
> Ryan
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


