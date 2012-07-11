Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <msundius@sundius.com>) id 1Sp2vN-0004s8-Cs
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Jul 2012 21:50:13 +0200
Received: by obcva7 with SMTP id va7so1904456obc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jul 2012 12:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=tkWbh09iYh317nmTaB4roWQlD3eRkLTsqRXGjBANqQc=;
	b=poMoiIjsvr7yYupkLAfu29ScdXF2Flcd35HtbL9cWB4FGOwuq+CDlDElgG+jwCZqH0
	qdJyFTue1qidckjD8TbcGdfC/j7+FWZZS59my9L5mjuIx5/IyqAv5L9NCEKn2k6vrgl9
	xTd0wg6dEjTE9kamxjqSLCHUDbBYHV4JzEzxuMNVN8B0mGgxP5jSscbzsAu/m/wGv0bx
	3V0TPofwL/xgjPBne8elI54RSpNcOHGUpvwotzjses+XTWmlbnwd7t0QQRC7Pc/5CL5i
	/SFm10V6JcJS1cERXgv2DS52YcDnyZZCdk16Lv2dBMErSJ0h143+HyQ1nkTeJEI2edI1
	jfkg==
MIME-Version: 1.0
Received: by 10.182.232.101 with SMTP id tn5mr1649630obc.49.1342035540513;
	Wed, 11 Jul 2012 12:39:00 -0700 (PDT)
Received: by 10.76.85.65 with HTTP; Wed, 11 Jul 2012 12:39:00 -0700 (PDT)
Date: Wed, 11 Jul 2012 15:39:00 -0400
Message-ID: <CAGVhguH9KnQxSbpytiof93769KpRJST5fj+9f4aQHWJ+7AsU4A@mail.gmail.com>
From: C Michael Sundius <msundius@sundius.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQn9f4QNWICe9nBcVhi7FVfA/x1Der6SwW4Of/+dMW0YzXpw++xHwx9zdgtuJqp6kTOrTYQm
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: bsp support for conga-b945
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
X-List-Received-Date: Wed, 11 Jul 2012 19:50:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I'm working on a project that is using a conga-b945 com express module.
This board has:

an intel core duo t7400 (2.16 GHz, 4 MB L2 Cache, 34 W)
an intel GME 82945 graphics and memory controller
Hub: Intel=AE 82801GBM (ICH7-M) I/O Controller: Winbond 83627HG Ethernet PH=
Y:
Intel=AE 82562

is there a BSP definition for this board or one like it out there?

thanks
Mike

