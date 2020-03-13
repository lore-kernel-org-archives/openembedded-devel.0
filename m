Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
	[209.85.210.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0B94861CC6
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 23:58:40 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id k26so12055826otr.2
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 16:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=Rq0sYyqzUa6ve58wf9QFme0R8HeZmQUxKqKZghBzCBs=;
	b=U5cx0/pNEnncr4fatQwFkIfgicrNZl0tjvC6z9kyzPJYmEHvLUJPpzn4cGvvZ2K/Vp
	ZSDRTomXJ9UpszClcCrE/N1kXodDQhvR2HIrGd10nTkIZ6CQR/iyX/Jt5xvMLDRbnptQ
	ktphpA+hPHyYm/VzIPZQOFTKIoswseSskpER4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Rq0sYyqzUa6ve58wf9QFme0R8HeZmQUxKqKZghBzCBs=;
	b=EHORUGMRN1EnIH5eoxUszpHhRztd76L8FhFYsnfo4lM49XKChh4+n6pu9mkv9EtkHQ
	lA7y9nQHOhadKNwgiUViWuE4R1YcUjkXyEkSVLWikPoGJ7nwtpyVKnmrVcT4I5gSKN3J
	fYQSSk+ChS6481cqJW3tpywLOSxLeIwNYj28HGxzVKleSxfkak8njIW1QTlshdgMn5VC
	n+UHChzD/STmzbRfVzlGIXLsEI8TKA3BFoWTYMdwsx3D3e1znJRSX/QjROq2CFP5tzzT
	0DPzsPkT8TBi6bANdUy+9xX0qpgtf75ytsvVEbRGsan8jPdXBf90mwPsVhfPfJLb+8Bs
	N+xQ==
X-Gm-Message-State: ANhLgQ1J8o7/behxC090+nK85oHxLZU2zUrnQFVLuTO3pN8eALngAoTt
	zTlF0iLSQguj/RLWJYFZ3c6MXziTd/rZgRXU2trQV6Ff4KA=
X-Google-Smtp-Source: ADFU+vuaWgTdGvwte3xYfKMHJQKAmg3AtmkhbSQgebszsBl7foyE7MTvX4gl+CdkhnwRtTLO9bnXGwslBIwcBSjzXlk=
X-Received: by 2002:a05:6830:1e25:: with SMTP id
	t5mr1367081otr.70.1584143921519; 
	Fri, 13 Mar 2020 16:58:41 -0700 (PDT)
MIME-Version: 1.0
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Fri, 13 Mar 2020 16:58:30 -0700
Message-ID: <CADfgfobNNXr9HSOiwyamzbZ4q1uc8wgD5PzobDF56cDyYui-HQ@mail.gmail.com>
To: bitbake-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-architecture@lists.openembedded.org, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Mailing list platform change March 20th
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Mar 2020 23:58:41 -0000
Content-Type: text/plain; charset="UTF-8"

We are moving our lists from Mailman to Groups.io. E-mail to lists will be
delayed during the move window. We are aiming to complete the migration
during business hours in the Pacific time zone.

A new account will be created for you on the Groups.io platform if you
don't already have one.

You can read more about the change on the wiki:
https://www.openembedded.org/wiki/GroupsMigration

If there are serious issues we will rollback the changes. We will e-mail
all lists when work is complete.

--
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

