Return-Path: <daniel@zonque.org>
X-Greylist: delayed 573 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 22 May 2017 17:09:43 UTC
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by mail.openembedded.org (Postfix) with ESMTP id 4517D60069
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 May 2017 17:09:43 +0000 (UTC)
Received: from [192.168.10.79] (pd95c9a6f.dip0.t-ipconnect.de [217.92.154.111])
	by mail.bugwerft.de (Postfix) with ESMTPSA id 1973D28046E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 May 2017 16:59:42 +0000 (UTC)
To: openembedded-devel@lists.openembedded.org
From: Daniel Mack <daniel@zonque.org>
Message-ID: <a884c6ab-8723-d322-30ec-52a67573ac28@zonque.org>
Date: Mon, 22 May 2017 19:00:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
Subject: [meta-qt5] Support for v4l cameras in QtWebEngine
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
X-List-Received-Date: Mon, 22 May 2017 17:09:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

Is anyone aware of any specific requirements or PACKAGECONFIG settings
needed to add V4L support to web applications running inside a
QtWebEngine widget?

It seems that out-of-the-box, the list of available video devices is
empty, and I wonder where to start digging.


Thanks,
Daniel

