Received: from [74.125.44.157] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1M1gZp-0007iV-JJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 May 2009 14:50:22 +0200
Received: by yx-out-1718.google.com with SMTP id 36so36868yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 May 2009 05:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=rHiaZiGukYQspdjVjcT4M1qx2jPv2A2rrhXfGHvTX4E=;
	b=Za12FCpy9SoteqbdfnTm8tsDdCFLdLJDrOG2tFws9PQxmjOccIJZNlFlmseJS//VKZ
	KZEEolk5RPXKYg6KkNLvKxRpkJSWDbaS27FnMveVu/mk2SD/i8FFEP6R38m/TngI5E+7
	yHlotxy1ElvJUTInUTr6nKTZXmhb+nwS7zTxY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=l6TPuVMY1AAZXhqCZ1DJR86w44Yo9xma4Y96M/4uxzSXzgNsCgT6xfRUhkKOOn4FRA
	r6oohl4yIVaWTb1h+uSftbQuDIUJ8fd/cmec4o9jdQuTfqDIYKLbwgvZ45rTZNSvTPno
	nOA0DwD0EY+K82RbI56RFy8fQ67pl8c+B9np0=
MIME-Version: 1.0
Received: by 10.151.121.12 with SMTP id y12mr2311611ybm.123.1241613861446; 
	Wed, 06 May 2009 05:44:21 -0700 (PDT)
In-Reply-To: <f96d234e0904300544g4f933c15x1abaa430373868fa@mail.gmail.com>
References: <f96d234e0904300544g4f933c15x1abaa430373868fa@mail.gmail.com>
Date: Wed, 6 May 2009 08:44:21 -0400
Message-ID: <f96d234e0905060544t21a91d25r8b8d1251f43b3e11@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: progress on OE organization issues
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
X-List-Received-Date: Wed, 06 May 2009 12:50:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

A new OE server has set up for testing at:

new.openembedded.org

The git repo has been set up (accessible via git and ssh).  Please do
not commit anything to this repo yet.  Currently I'm just syncing from
the main server with rsync.

Next will be cgit followed by mediawiki, patchwork, and bugzilla.

Thanks to nslu2-linux folks for providing this server.

Thanks,
Cliff

On Thu, Apr 30, 2009 at 8:44 AM, Cliff Brake <cliff.brake@gmail.com> wrote:
> We are making progress on some of the OE organizational issues.
>
> 1) we have been offered a VM at OSUOSL for hosting OE infrastructure.
> Same rack as kernel.org machines, and has a good reputation for
> support and uptime. =A0See
> http://wiki.openembedded.net/index.php/Infrastructure for more
> details.
> 2) we are trying to push forward with some form of structure for
> membership, and effective decision making:
> http://wiki.openembedded.net/index.php/Organization. =A0Florian Boor has
> offered to take care of the membership tasks.
>
> Thanks,
> Cliff
>
> --
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Cliff Brake
> http://bec-systems.com
>


