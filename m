Return-Path: <amey.patil@sjsu.edu>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 714AC715D7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2014 16:45:07 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id gb8so1481689lab.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2014 09:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sjsu.edu; s=google;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=QQTkZuYuemegE5WHT8x+xUxOfeCWI5CoPOIYF/FygMs=;
	b=fotqLGFJx6VjMomVEmI+mBQ2V6W5/wYY76BqwQVIKH4WhtDrDAMI7o759cUGhs5rBl
	zf2RXE4efeeavChzlFJwhr4Xj2E3zATX3gOADSeCqEPSq0MbgAB5my+xh3cWSSgqdrQV
	h2LZKEN41hfzb3gKB4fbuCjvWZcNr7EGMf6z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=QQTkZuYuemegE5WHT8x+xUxOfeCWI5CoPOIYF/FygMs=;
	b=Zm+3yszX/c22TDYPcuwDHjxKaZHP1T16KRfKiEWvI7GMXlrJZNy2ua0yTFwGdPZD5W
	GUCEr5DAtp2OzjMSPc/o6zebREjq9MmY7We2unTcSQ4ABTc9j7gMwpd9mF0zc2HgAU1z
	YgUKadYHvkR+R1o8pXnpQoJFxvZ8D3eyya0awK2DJqKRUKr12mTSrP8SnStmmUyFVXVK
	VRUyYiNnmJChvOhpcojdYC0zEPWK0OM4ySE7rSGTlfGGtnQeGjTRr7YyREx2T8oiVxXA
	cJSZO9xa5T+87jryjsJi9adbvE8OlczIKVdIIaEF/K6/HW/YnuT/VNzrBrL70kxgC6c2
	l++Q==
X-Gm-Message-State: ALoCoQkW3NJsBoY28ZJUCuVkcLiVO/2sgCOgGe9vxMFh06pNsj7xC0mkC2ZtOO+cR4hO/G/i0SXV
MIME-Version: 1.0
X-Received: by 10.152.22.200 with SMTP id g8mr7659121laf.1.1411577108130; Wed,
	24 Sep 2014 09:45:08 -0700 (PDT)
Received: by 10.25.20.84 with HTTP; Wed, 24 Sep 2014 09:45:08 -0700 (PDT)
Date: Wed, 24 Sep 2014 09:45:08 -0700
Message-ID: <CADJ8CoP_ODn_sjTOS6PhTMU5527GymiDXJ+0bAw3SSYQCMui4w@mail.gmail.com>
From: Amey Patil <amey.patil@sjsu.edu>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: How to configure Qt5 for Beaglebone Black
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
X-List-Received-Date: Wed, 24 Sep 2014 16:45:13 -0000
Content-Type: text/plain; charset=UTF-8

Hi all,

Searched a lot online.
Didn't find any working source for configuring Qt5 for Beaglebone Black.
Can you help me with same.

Thanks in advance.

Sincere Regards,
Amey Uday Patil

