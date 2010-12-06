Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sylvain.pare@gmail.com>) id 1PPZrO-0002YH-Ng
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Dec 2010 13:08:03 +0100
Received: by qyk8 with SMTP id 8so3214353qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Dec 2010 04:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=3TCmXeO8zy59VyVzjd/qIUJMO/sk/hcCvqWiTQlS0O0=;
	b=woVD2cjm9R5LeRUDrRceCNa3z6VqB/KMeN3nXgNYBQTw8BwQy5Ft72wq7vs4oAI+gj
	LmJC2Vu/zfjzps/9bX0bpHC6BTpV0qjc8usLIe6QdXakLJst4FPoSOQxfY0oQxEiFOXy
	sc2ItzXB5af22YBEWA5b69bOzx1N4XzJO1ws0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=EEJyjZUUSgjpER5REapw29FSwLxjKanEo3qKdXbwHu7IbS4R3T8JFBLAsFNvpHLyBU
	EMkzflUECPA8aVPfYX9eziu/wASS9CUwciHDv3UCUE9vFDMOr3pUpku76Hi6ypABWNbj
	6OahGIBLgHFs9MmNGHhVcgoUMNGIrQr5vuQ5Y=
Received: by 10.229.183.135 with SMTP id cg7mr4213086qcb.296.1291637194984;
	Mon, 06 Dec 2010 04:06:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.185.81 with HTTP; Mon, 6 Dec 2010 04:06:14 -0800 (PST)
In-Reply-To: <4CFAE2EB.6080901@freyther.de>
References: <AANLkTimx+osQLb0Km1pXgQuPEwx3r1-ovhD9um_9p8GV@mail.gmail.com>
	<1291133947.3599.16.camel@mattotaupa>
	<AANLkTi=DUaiM6LhuWG6MVOntGBu7oikQm9QesD37zRj5@mail.gmail.com>
	<4CF56767.3050007@freyther.de>
	<AANLkTinp2NUm-WqGA+3n4sufPhMM0mB=dcH+Y-uMZ6Wf@mail.gmail.com>
	<AANLkTi=G2iFhxVK8kg5+rwLq82vVku3UD-CAUOBKrPEw@mail.gmail.com>
	<4CFAE2EB.6080901@freyther.de>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Mon, 6 Dec 2010 13:06:14 +0100
Message-ID: <AANLkTim9_DEEDxPA76BJfRUGbB+6EHC1vvwqR34=Ucut@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: sylvain.pare@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: package request for Phonon-VLC backend
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
X-List-Received-Date: Mon, 06 Dec 2010 12:08:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Holger,
Thanks for your answer, I will take a look at this.  But just for the record



> # OE lacks some native qt4 tools, so we use the ones form the host :/
>

is from automoc-native from OE.
So if what you say is true, and i don't doubt about it, then automoc-native
recipe in OE really needs to be updated/cleaned.

Thanks again.

Sylvain

