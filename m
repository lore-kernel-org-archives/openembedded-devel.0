Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
	[209.85.222.181])
	by mail.openembedded.org (Postfix) with ESMTP id B169B7C043
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2019 18:11:23 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id 189so11087182qkj.8
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2019 10:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=2rktnYyUXWg6VqF7ZodERu70Lz485kPj1EbWRKc/g0w=;
	b=R+5dkaXn3dImNL8ry1AgrnYGWKOQV1tM3GeRbwn6N/ZonYG+P4FVl6iQsRXnCL5z9k
	2tdGRPoXGAA1YbXR9QFQhdfdfniAqKycBN5rCsbwr02tUrIm2JP378DSckCQM+n1vL4z
	TkYoiQSNnARrfo8Ibix+pKYOlAVxDUFfub7uENcr3M5lwn1mBfXHFifYbMBFCoPB2BMd
	JFoEzyqUNg0tFIjdXX4P/9SZmVZLREnU4oQmwlTqTZSDOJ8rzXyheWUixLBmXY20w/0J
	dwTgCqj16V3WjDlI/wEsTdr0gTKxFaISlT05G8mv5OW27ItKBLXovtKrcStjX7sKopcf
	+Z6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=2rktnYyUXWg6VqF7ZodERu70Lz485kPj1EbWRKc/g0w=;
	b=LJs0OrDGGwb3/zfTSROyO/+reiZxvWakzMJkzOZtxrZwdt7o3W9nqTSfWj7orz0Sr+
	YyuPZZQ+ucoJSOD22m6Y5uBtHBqwO6xaYNrHu1RlA0XXr5goUTYRJQZvZ5bnPqxGHSHJ
	xfCIVHemcb9rvpEdKZjQ0C+Fp8jC9TISkTTwpic8OrSFD3d+HqBJbuPbAwt81C6tEzIX
	CT9CTuOnyABcb+9JI4xW9V8pfpriggSZXmoOjccqmO/e5/3L/3QOkFG1Km1nC55HOl94
	Eg2NbvsPFgV9J+FS66pNXHnpEJvuh/53dm1Gmqjp8YDoDPZ0i70bv7Zzl0KyCmL13AC8
	VrDw==
X-Gm-Message-State: AJcUukeGLOE20nwupM2y95tv2UaJCGNdcHmZolnOMGXMc6QjxK4pivcr
	kasJ6qoE3MRAZfPh0BJqw9azmm1j4dhqxxpIfrpX6XOSPrA=
X-Google-Smtp-Source: ALg8bN5Qb614ztIZCrVcoXPm+O4K2JJ8FrP7K30vPXzI7vpOQYbo7Xxab0u7YvKp3vNv4gPqQ1smODjdmkmf9RE1ZTo=
X-Received: by 2002:a37:4c41:: with SMTP id z62mr23042508qka.206.1547489484276;
	Mon, 14 Jan 2019 10:11:24 -0800 (PST)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Jan 2019 10:10:58 -0800
Message-ID: <CAMKF1sov1wQAYpuwEGEq4f3gasM7Dd5PHfjgFpPcPMCGfPn7=w@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of the world, 2019-01-13
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
X-List-Received-Date: Mon, 14 Jan 2019 18:11:24 -0000
Content-Type: text/plain; charset="UTF-8"

Hi all

Below is the latest status of OE-World, due to glibc version going
backward issue the
logs are too large for wiki. So just posting the jenkins link for
everyones reference.

http://jenkins.nas-admin.org/view/OE/job/oe_world_workspace-parse-results/474/consoleFull

Thanks
-Khem

