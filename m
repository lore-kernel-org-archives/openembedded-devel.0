Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
	[209.85.167.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1F1C160F32
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2020 16:44:54 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id 9so3327120oiq.12
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2020 09:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=PHT0ibg/IfCI9Z7QE6cxK1xt/RNq3J/mKnMXaMNQgDM=;
	b=FlFAC4pExC2YxCrloI+bpptOiV67xIbqj8REcdzE/eOarukLXVfMnFbCa+8mpoDDS0
	FPWOjWjZPB+SAY8gjWpyovtwjRmCgkdmeHJEEsCp0PYhb9qzC9+IKJdG11nhngxlykZP
	IfFylI9qoPXLfAEiYhWu5FdqIMybYNVH9d4Q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=PHT0ibg/IfCI9Z7QE6cxK1xt/RNq3J/mKnMXaMNQgDM=;
	b=N0CM6HCNrZGkaHuy4ItWl+Q7PyHOTPWN1Eu+dhKbhJRFelEKA/+yyAnXSmyZfJHKQL
	e3vsdytLnwHouxQwq9UXcH1ll+WaMubr7HWZlNMvYjPGZ5fvL0mQbPjNJevm4ed6UFd4
	huZ3eMjztGvyNxQguKv/8xtTjR9WQ0jABRR7yxqDa7JkIRewOpQdkeegJbKB8eEh9DlQ
	u+1aFkuhpNbbw0nLV0S9F53rlsEyVyVxgp1vrOuKFrEQSVts03U0bdrsjTrFYCAItAls
	X3OzAxJB2iv4/lEiDLNN/wBUABSLMe2zQU7KoMv6vpWmbGL/8VhWRe7iw7/c+l+iY8yN
	P5tQ==
X-Gm-Message-State: ANhLgQ2G8DVzUR8tMSrc+B3ftc93eEn/5gwXOJyoXUgvvSX2GZQNQ2K5
	4oGUrxLhLWlFfixUOHbLuvZGIiB3dP9hj+5kCpnXgQ==
X-Google-Smtp-Source: ADFU+vsbozWCzHOBfG0Encl02Jiy1tH9FESgJh6BE8rNrAb81tAJhvLpjJhfAo3bEUJyO/fse8dfWAeOtuGWbFZxdvM=
X-Received: by 2002:aca:56c2:: with SMTP id k185mr2909127oib.141.1584636295002;
	Thu, 19 Mar 2020 09:44:55 -0700 (PDT)
MIME-Version: 1.0
References: <CADfgfobNNXr9HSOiwyamzbZ4q1uc8wgD5PzobDF56cDyYui-HQ@mail.gmail.com>
In-Reply-To: <CADfgfobNNXr9HSOiwyamzbZ4q1uc8wgD5PzobDF56cDyYui-HQ@mail.gmail.com>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Thu, 19 Mar 2020 09:44:43 -0700
Message-ID: <CADfgfoYCjVip=oc_U0TdFzOVst5U-KU+R31JhdckRv77APzQ-g@mail.gmail.com>
To: bitbake-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-architecture@lists.openembedded.org, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Mailing list platform change March 20th
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
X-List-Received-Date: Thu, 19 Mar 2020 16:44:54 -0000
Content-Type: text/plain; charset="UTF-8"

Everything is proceeding smoothly and this work will continue as planned.
The migration starts at noon PDT tomorrow.

List owners please take care of all outstanding moderation in the next 24
hours to ensure a smooth transition.

Thank you,
--
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

On Fri, Mar 13, 2020 at 4:58 PM Michael Halstead <
mhalstead@linuxfoundation.org> wrote:

> We are moving our lists from Mailman to Groups.io. E-mail to lists will
> be delayed during the move window. We are aiming to complete the migration
> during business hours in the Pacific time zone.
>
> A new account will be created for you on the Groups.io platform if you
> don't already have one.
>
> You can read more about the change on the wiki:
> https://www.openembedded.org/wiki/GroupsMigration
>
> If there are serious issues we will rollback the changes. We will e-mail
> all lists when work is complete.
>
> --
> Michael Halstead
> Linux Foundation / Yocto Project
> Systems Operations Engineer
>
>

