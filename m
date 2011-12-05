Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RXeeM-0004Hm-7B
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Dec 2011 20:56:32 +0100
Received: by qadb17 with SMTP id b17so1958139qad.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Dec 2011 11:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=qljhonz4yPE/meodGRECzf/7gTyXuM/pnSE7aqLIROA=;
	b=uxRE4AWNuboxOBGRb3krU5NlVofkSjkTzRBATyENIVvXG1T80go/7gRM4Sg8T/W+I9
	E8NuPfy0+Wvm1CZ4XrKGfzk4bfiNzVxhGzjQ7wJH+YjpnCSYoH+DkE/PrDl8BfYtILkm
	HdHVvZMmAnIeF48JEk0wFgai5Vl4/NIQadO8M=
MIME-Version: 1.0
Received: by 10.224.198.10 with SMTP id em10mr9184315qab.44.1323114581212;
	Mon, 05 Dec 2011 11:49:41 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Mon, 5 Dec 2011 11:49:41 -0800 (PST)
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C401A486D@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C401A486D@post.tritech.se>
Date: Mon, 5 Dec 2011 12:49:41 -0700
Message-ID: <CA+M6bXnrw7p=5ACg99REKASR4L+0yzgunJ6xDWWSwcFeR82hww@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance] Pull request for libpam
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
X-List-Received-Date: Mon, 05 Dec 2011 19:56:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 5, 2011 at 9:42 AM, Mats K=E4rrman <Mats.Karrman@tritech.se> wr=
ote:
> Hello Tom,
>
> Please pull this commit from here:
>
> git://github.com/mkarrman/openembedded
> Branch: maintenance
>
> Mats K=E4rrman (1):
> =A0 =A0 =A0368c68a =A0libpam_1.1.1: remove directory preventing /var/run =
from being volatile.

Where is this a backport from?  Thanks!

--=20
Tom


