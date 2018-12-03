Return-Path: <brendank310@gmail.com>
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id DBB4C6C64B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Dec 2018 13:41:38 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id i7so13661018qtj.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2018 05:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=UBrgRzRVX5CXNZnqyM3gfqnLcYjxN4qg4NlQojwSvwo=;
	b=DlHWyYuXgjTKAWjSJ2vHql3wle3RVm2re4XvJHlOj2ZCI6VFH3O5i4auxYv/AHfoCU
	MjWzhtuDVeHWcG/wz7M3WmK9POmkbkL42X/vExQbCWU7tRhF0Q0lPlCSTdWgv4TtfBUx
	z+UDlrJ8/zL6ludW5kbpZ7pbhMa51GwLEes/RNzFqB2AHDxqVYYpHnc6ZIDGr3TjEn9e
	kjzO6lA4Nqs8R0SHkKHA/+q2qnPEEssCByfddt4eXbErxZcvFLp4bdBJlfgKwnjq+I5t
	8r8yU0dPU/jP+fLLHmEE3OrtT+Igv5MsedsNojfOaNXHHbVLMMS4tAHtGMbQbZfyeZ03
	CEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=UBrgRzRVX5CXNZnqyM3gfqnLcYjxN4qg4NlQojwSvwo=;
	b=L2n/2FnvyTt7FvUmQTQ2Ph199u4IPs/VQ5ZB+SHTZIiT96kyn5QpGsJZSb6YMCnppl
	+XNiNpo4RcnIZWA9oxeEe4D8p14wG0DfwWI++C+pkPmGzWRM1Weaby1jg77F3Bi3QoUs
	X/DecI4X1XjkYG2qnzBbSBuWU8s5TB2AL8c2KnWeH9Nklqv0rvgZdVdeYY2JID9Pep1Z
	i3w0FmG+PeTsJX/3qJfK1vGCJzOBdVJYOJwrdQyxkdOhFLiL2tcf1c/l8kSeMI38tvPJ
	z3KrEYbaGqrNo1lkTNPZ8YLqtf7xRdW53G3/KQB1kEOjRlIvvRduhjRTpssExtD3Vimt
	FlNg==
X-Gm-Message-State: AA+aEWaY47hLtFM60/Ci7LL4LpKBbKwHnSzQsst/dzQuah/CaPuJpIGf
	H4cQU/ffY+e8UdJc0koWAjc=
X-Google-Smtp-Source: AFSGD/WwVLZnz5tEBOBjze4QYtiVgLKc9QHk255/ez9164xu4YAtSguRiAgzB1rHOXQHTAAEKZwvVQ==
X-Received: by 2002:a0c:d29b:: with SMTP id q27mr15754651qvh.62.1543844499653; 
	Mon, 03 Dec 2018 05:41:39 -0800 (PST)
Received: from ?IPv6:2600:1017:b001:14ea:a01b:5883:6042:6d3f?
	([2600:1017:b001:14ea:a01b:5883:6042:6d3f])
	by smtp.gmail.com with ESMTPSA id 20sm8189859qtp.54.2018.12.03.05.41.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Dec 2018 05:41:38 -0800 (PST)
Mime-Version: 1.0 (1.0)
From: brendank310@gmail.com
X-Mailer: iPhone Mail (16A404)
In-Reply-To: <CAD9sEJvYu=QUUraaJmXtYNnFgU8Hex1_H3dKA84KOU1Sma3bkw@mail.gmail.com>
Date: Mon, 3 Dec 2018 08:41:37 -0500
Message-Id: <1A48FFA9-1E49-4892-BD92-8C1200DB3D45@gmail.com>
References: <CAD9sEJvYu=QUUraaJmXtYNnFgU8Hex1_H3dKA84KOU1Sma3bkw@mail.gmail.com>
To: Knoppix <theknoppix@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: progress of gnome3-full-desktop-environment
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
X-List-Received-Date: Mon, 03 Dec 2018 13:41:39 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

The initial patch series has been posted and I have the revisions in progres=
s. I should have a v2 series posted this week.

-Brendan=20

> On Dec 2, 2018, at 11:59 PM, Knoppix <theknoppix@gmail.com> wrote:
>=20
> Hi,
> How can I learn what is the progress of gnome3 DE support? I know that
> there are serios work to implement full-gnome3 on oe-devel but I dont know=

> how can I check last status (I mean which recipes has not implemented yet
> etc)
>=20
> Regards.
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

