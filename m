Return-Path: <theknoppix@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id C33A46B8D5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Dec 2018 04:59:41 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id n190so1838957wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Dec 2018 20:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=DraiB1gQOB9pUAY07tOpVWr8TtfRplAHdBn2Qmzy/bc=;
	b=Njqsorkkm2Bgi7BlcNEsZCrzvOC36lyN5U4ft8KJ/NbnYElDbbOE/0hcWUzvG8akb5
	X0BH6noS2nqZ/0FoB+zw3qrDgw4EDppACjSHGmE8DfjShSR09ETusHdH4+Kq0M3T5yxG
	p96SzfWoIqYDzXShi/hoAboQC+zIxxE9j47tI3nFfh0jUrSSVLMA97yEexdgR+jjB6p+
	czhncwhPbObnIFtToF8fAl9TftK5IphdFV2sCFcu7AwLjuZ2bJqiDMaMjwHtpHsXQVqP
	kUA29l7LA0XA391Uxb9uniGuuQBBxk3N7fTQQsF+Xzr8Y3SaGWUv5Y9ekM1LXBqYd7iZ
	08rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=DraiB1gQOB9pUAY07tOpVWr8TtfRplAHdBn2Qmzy/bc=;
	b=g6bRmTwlqzT9bmeCVG3SdMfT7MkCaR671+PcJ1MbiwCbWzxtq4abg1Dmusles/O4Zp
	9XsziBFMQNlN4Hm5p+HuPnkbJhowcPM/4NhbAErMeLV9b3f0Q1KpK4OM5jPQZkOP2ym6
	Hvz24eB8Z2A6vRWJXGr2tN7QGl6Jd+Fx8U5VOOISPye4JfgDDgJTVhpL8iTxGz9mcuh/
	Hp0uHhl5EQi1bXxacuXnZGzdKCe0JeoXQswguGNNQ5zPUdzGDaZ0FYHtz+ZjA4GaNXcL
	MjKCAylbJLVmli5+XmJbkFyi10NA103IMbBqWgdjlnWLF7gGboPl+FJlYLQL3PHwboBD
	wK2A==
X-Gm-Message-State: AA+aEWbhsQPxYI1QSpKHV6HPvCVpO5TLmbbEwiii0LHQU5X7unmAx8NI
	+WYqEW6q7uEaOyhRXbIo9s+fmonaV+Ynga1+T4ZlNg==
X-Google-Smtp-Source: AFSGD/VCQ61MrTsz+Oc+hU9Rgaohn5Vma22VGgIB9Yz9/PngBXD91ZIVQeg6EztC/iiZyUu+oCQ1YWHEwUkkZeKYB0U=
X-Received: by 2002:a1c:18c:: with SMTP id 134mr6611461wmb.88.1543813182238;
	Sun, 02 Dec 2018 20:59:42 -0800 (PST)
MIME-Version: 1.0
From: Knoppix <theknoppix@gmail.com>
Date: Mon, 3 Dec 2018 07:59:30 +0300
Message-ID: <CAD9sEJvYu=QUUraaJmXtYNnFgU8Hex1_H3dKA84KOU1Sma3bkw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: progress of gnome3-full-desktop-environment
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
X-List-Received-Date: Mon, 03 Dec 2018 04:59:42 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,
How can I learn what is the progress of gnome3 DE support? I know that
there are serios work to implement full-gnome3 on oe-devel but I dont know
how can I check last status (I mean which recipes has not implemented yet
etc)

Regards.

