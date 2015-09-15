Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 07A6476DFF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 11:14:53 +0000 (UTC)
Received: by qgx61 with SMTP id 61so139163844qgx.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 04:14:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=mVUgtoACQd39Uxynb1SiJQIXvK5k1+LmRWYBrxwnIZo=;
	b=F/SlbLHyKsBjQo15cTjWj59VYGCCqubMzoaMsW9UEuJEWXcjvjfnSfVhk6fy4PIxBV
	dHBWxUm4aZqYFUkkKw18IcoixuUcEpyrKYdVGw5No7kz359dnxUSRKLyRs91RwaSEz4L
	ugrvWZ/0wHJy0aPSXyTfnORSHYO1nk4Xg5pxFvlNwQjmedNcxO1adDVkkIYQGpVQDhzd
	HkSw7sg8+wgGrcZuFl+49u1o8oKpPeoxxPHyegNSXh0je6UvNtovRz+WZz4uQpeT+Du/
	7KRwEzbxGQLV0iQUtBsC4jdje2+E7R9IF2+AWh1auCYHU3q1X8LgHtPXg0nM0C0cqwJr
	LxtQ==
X-Gm-Message-State: ALoCoQmzSjUjlIvlenfwSH3fFwzU9meJnTSGPvyy7Z0Bzqjluq46lMWlOf8SuwiC1AP7BvDhpV4d
X-Received: by 10.140.232.150 with SMTP id d144mr32257779qhc.17.1442315693587; 
	Tue, 15 Sep 2015 04:14:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Tue, 15 Sep 2015 04:14:34 -0700 (PDT)
In-Reply-To: <CAJTo0LZQhC+QjAcNxxUuQpUkfWgXc-rVDohQe-sb8Ch1d57R2g@mail.gmail.com>
References: <55F7EF3A.7020403@topic.nl>
	<CAJTo0LZQhC+QjAcNxxUuQpUkfWgXc-rVDohQe-sb8Ch1d57R2g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 15 Sep 2015 12:14:34 +0100
Message-ID: <CAJTo0LZVtrC-93qCesHSpet689+3vQN=Wc0+N46_H8g4qkFb7A@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: gnome-icon-theme?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Sep 2015 11:14:54 -0000
Content-Type: text/plain; charset=UTF-8

On 15 September 2015 at 12:13, Burton, Ross <ross.burton@intel.com> wrote:

> Yeah this was just removed from oe-core but the addition to meta-oe hasn't
> happened.  I can send a patch now if there isn't one on the list.
>

Hm, alternatively,  we make adwaita-icon-theme provide gnome-icon-theme, as
they're broadly compatible anyway.  Any thoughts?

Ross

