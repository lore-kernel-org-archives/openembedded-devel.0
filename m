Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1PipVi-0000j0-Ma
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 15:41:14 +0100
Received: by iwn8 with SMTP id 8so3267987iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 06:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=SRejxPNsopVVTRheq8qW6cf+h0NZOHLS3YneKp7R0QQ=;
	b=t74J4/xdG32FD/ZLZhOpYiFOaLuPOX/Z2uzorXl8TabQ+/m9Fkjk12RKOyJsHTgkkE
	BHzYReUoN+3Yk/W7ACS/GFleL6OkJxCSiSwbumpqErXplU3G9o1CXCeTxUPzWb5Krd2W
	ZvIyxLu14C/TN6lilZv/0wt31d3qnVUZgsZ7g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=bqsol017T/Qm9IS3n80EKtaidPpEVM/by2xgHcmPVi37XQC3p8O3o1bJ0DTRB08MEv
	sNEm05qy1611kWmGdCTX/ZVG1xCE81ZHyOADL8Yb6utdRnViTjEyLG8N4BXxnC1iP6nT
	65djNgTKKJjXwAqZL3t4PNEjuc2zIoJjg13Gs=
MIME-Version: 1.0
Received: by 10.231.199.212 with SMTP id et20mr2760141ibb.22.1296225623618;
	Fri, 28 Jan 2011 06:40:23 -0800 (PST)
Received: by 10.231.38.4 with HTTP; Fri, 28 Jan 2011 06:40:23 -0800 (PST)
In-Reply-To: <AANLkTinTV+FMDzCSQKGjB81LGgp4L8eyceusVNs4CWCL@mail.gmail.com>
References: <AANLkTinTV+FMDzCSQKGjB81LGgp4L8eyceusVNs4CWCL@mail.gmail.com>
Date: Fri, 28 Jan 2011 09:40:23 -0500
Message-ID: <AANLkTikBTNT7o1QeL8A914XoEpfGcQ3b5wtskRUzcd=A@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: testing branch 2011-01-28
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
X-List-Received-Date: Fri, 28 Jan 2011 14:41:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

Excellent testing run last week:

http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=tested_2011-01-20

37 entries in the table, and very good coverage of machines, distros,
images, and host systems.

for more information on the OE testing effort, please see:
http://www.openembedded.org/index.php/Testing

Thanks,
Cliff

On Fri, Jan 28, 2011 at 9:30 AM, Cliff Brake <cliff.brake@gmail.com> wrote:
> master has been merged to testing-next and is ready for clean builds.
>
> Thanks,
> Cliff
>
> --
> =================
> http://bec-systems.com
>



-- 
=================
http://bec-systems.com


