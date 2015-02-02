Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4BD006E618
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  2 Feb 2015 17:26:45 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id e89so48478163qgf.2
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 02 Feb 2015 09:26:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cgRGwKVobBPqxmXy1UagakM18sNPtJF6rk6A1YMSUF8=;
	b=OG5jNKipof/B1GqHSS0s1MmpA4xTu/nhnCpKqmdLFzWWLcxS9ZpEusdG3j58HVHk2+
	iVTb/PKV5W/fTN9ZflofJATCY4tx0XhjcWtLzaVzXYj6gTOdstnC3qDZJWjbpqoJkV25
	A+ba46z3orEu6iHOlNBkxMkMSqHYjET3lfW9b02NKeVp+tXhGbHf4Dnp9jgPwAGuG4fG
	petOC9YIbOAwHjSf7gKxjivKa/fsbNPtcw7+jXdHNsbEo5AJIiDgf8XUiu1f3eIggt/K
	/qbMVnEJLgTCIJQH506DJQGi83pzzNEkNXTeWKoENTq2xgbNI6gAEqFG7s9Ib8OX94GM
	baWQ==
X-Gm-Message-State: ALoCoQmqW7zAFMbFV+DKxS9UET4tytz33cSrY68P6zbK31fr+T0IqsDHiWCHwr+jS+DUqZO9hOUv
X-Received: by 10.140.21.48 with SMTP id 45mr41346017qgk.87.1422898006834;
	Mon, 02 Feb 2015 09:26:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Mon, 2 Feb 2015 09:26:26 -0800 (PST)
In-Reply-To: <54CFA8A5.7090504@mvista.com>
References: <CAMKF1souj1-FLTjkQb0y8myTiKMJyNeAa7wiM5-pW1fz0EtheA@mail.gmail.com>
	<54CFA8A5.7090504@mvista.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 2 Feb 2015 17:26:26 +0000
Message-ID: <CAJTo0LbhMAnd=TKhbWHhTsbca_bVSvtjLFsR6b_P5gsarO7AOg@mail.gmail.com>
To: akuster <akuster@mvista.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] upcoming glibc 2.21 and gcc 4.9 upgrade
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
X-List-Received-Date: Mon, 02 Feb 2015 17:26:49 -0000
Content-Type: text/plain; charset=UTF-8

Armin,

On 2 February 2015 at 16:41, akuster <akuster@mvista.com> wrote:

> If I knew what "testing' entailed I would through some time at this.
>

"Please build your stuff with this glibc/gcc and check it still works".

Ross

