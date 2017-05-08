Return-Path: <prvs=9301115377=michael.davis@essvote.com>
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id 731F771988
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 May 2017 21:00:06 +0000 (UTC)
X-AuditID: 0a000213-db7ff7000000261c-1f-5910dc564d19
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	0A.2B.09756.65CD0195; Mon,  8 May 2017 16:00:07 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Mon, 8 May 2017 16:00:06 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-browser]Chromium and libav
Thread-Index: AdLIPhFDLfL75GfsQuWH6w7ukrHHKw==
Date: Mon, 8 May 2017 21:00:06 +0000
Message-ID: <655290B7709079438B7932553958E60D16D2B56C@ESS-EX01.essvote.corp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.77]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBLMWRmVeSWpSXmKPExsWyRiBPQzf8jkCkwdSZfBbzVk1ktrjw/Q67
	xcXDS5ktulesYHVg8Zix5AWjx7mNKxg9Gvp7GAOYo7htkhJLyoIz0/P07RK4M1bfbWMpaBOt
	aPzynbWBcYdQFyMnh4SAicS6s3sZuxi5OIQETjBKbN19jQXCmckocXHRUiaQKjYBI4lz1zcx
	gtgiArES8zbNZAIpYhZoZZS4/WkdWJGwgKbE/babLBBFehLPds1hh7Gfd9wDs1kEVCT+zVkI
	Vs8rECQxq/8kWJxRQEzi+6k1YHFmAXGJW0/mM0GcJyCxZM95ZghbVOLl43+sELacxLumNiCb
	A6g+X+L3zUyIkYISJ2c+YZnAKDQLyaRZCFWzkFQtYGRexSiYm5iZY6iXWlxcll+Sqpecn7uJ
	ERjeXAxMwjsY50yxPcQowMGoxMN7oYs/Uog1say4MvcQozQHi5I477OVzJFCAumJJanZqakF
	qUXxRaU5qcWHGJk4OA8xSnBwSYkUp+alpBYllpZkxINiIr4YGBVSDYzJMqyHpiddnihQuXy6
	nbns0qZp04Ivr3wzRXuH57mV8ov7J3MK7eY977Lhyd/6vkc7VVoX3c5UXrrTMTWa2/9O7vrz
	E755rlCpdlzyZ4tDWoX6wlCuKxxdf/K6yvj+mPqW+UQ+W1cY/9Ln3D4HvY1vv9vNVfdkvx6m
	ITD//Ba7rNd7XlgbznZXYinOSDTUYi4qTgQAIQ/YmGsCAAA=
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "denis@eukrea.com" <denis@eukrea.com>,
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"eric@eukrea.com" <eric@eukrea.com>
Subject: [meta-browser]Chromium and libav
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
X-List-Received-Date: Mon, 08 May 2017 21:00:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Just wanted to ask a hopefully simple question.  Is there a reason chromium=
 depends upon libav?
Chromium seems to build its own ffmpeg internally and doesn't use the exter=
nal one at all.

Thanks,
Mike


