Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SoKkT-0002aC-NL
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jul 2012 22:40:01 +0200
Received: by ggnp4 with SMTP id p4so9825564ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2012 13:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=6GxpdKTXEMOEgFp95Ga2uFVDOg8J0QCpHhlXkWuFVNc=;
	b=PVbGDkKY4JJeEK9KJw0seer16Hm1m6AvnOL5h6llIhRYO+YGuw8kx31wCUSB1eZe77
	YpLV1ppgQcc0hOD4OLEclsHFi7y62MghBOZbLQEngcYzZDTg372QKcZ1IGLVPxUzDoC5
	NDxWZYXwMH9Ef7FPlvVt6uhjwKZ0xlheQTUyBNXmcqUw94hUDi9GGz11e9AzTNACqNnR
	E3W9Ydp94/9SxwoN4/qFxw+eMKopg1UM+8H8+xeTPiG+JNxWEh4yfhtMgRmdicnxz7UW
	9LBmIWEj0bQ9KpfYgyJgiQ8Syc+LfQXSYmKYYGFi7nWVC40dIc5FnqMbSkJgdSjFjyou
	2BiQ==
Received: by 10.43.70.71 with SMTP id yf7mr21177140icb.14.1341865731400; Mon,
	09 Jul 2012 13:28:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.98.162 with HTTP; Mon, 9 Jul 2012 13:28:31 -0700 (PDT)
X-Originating-IP: [79.117.115.156]
In-Reply-To: <20120709170052.GA6220@hermes>
References: <1341759929-32341-1-git-send-email-apelete@seketeli.net>
	<CAK18fxF6azr6-4B-=AQOYTe2hkXpQ52P4D12y0O2hx8y6z5=9g@mail.gmail.com>
	<20120709170052.GA6220@hermes>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 9 Jul 2012 23:28:31 +0300
Message-ID: <CAK18fxHkfTTtHNv=vU_L3_VwCmoa3r9e30L=LSd4uYgGWHg0VQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlyxENyYrM8bjQzFqa4nteBQNRPsf/DTpjDT6PL+o9TgA8SfZG7BOjnmjOR9/AaszlEi+sv
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [oe-classic][PATCH] libpng: update SRC_URI
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
X-List-Received-Date: Mon, 09 Jul 2012 20:40:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 9, 2012 at 8:00 PM, Apelete Seketeli <apelete@seketeli.net>wrot=
e:

> Le 09-Jul-12, Andrei Gherzan a =E9crit:
> > On Sun, Jul 8, 2012 at 6:05 PM, Apelete Seketeli <apelete@seketeli.net
> >wrote:
> >
> > > Update the SRC_URI of libpng.inc to ftp.lfs-matrix.net since
> > > ftp.simplesystems.org seems to be down.
> > >
> > >
> > Now it's up and running. Could have been a temporary server problem or =
a
> > local one.
>
> ftp.simplesystems.org is up and running indeed, but libpng1.2.44 is no
> longer available on it. It is still available at ftp.lfs-matrix.net
> though; maybe I should have explained it better on the commit message.
>
>
ftp://ftp.simplesystems.org/pub/libpng/libpng-canonical-test01/gz/libpng-1.=
2.44.tar.gz
So it is here. :)

Indeed the path is changed.

@g

