Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with ESMTP id 472E471AE4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jan 2017 17:59:42 +0000 (UTC)
Received: (qmail 29923 invoked by uid 1003); 17 Jan 2017 17:59:42 -0000
Received: from unknown (HELO ?192.168.11.142?)
	(philip@opensdr.com@108.4.175.67)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	17 Jan 2017 17:59:42 -0000
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
From: Philip Balister <philip@balister.org>
Message-ID: <6e19dc90-a9d9-7d13-69d9-f86788c16375@balister.org>
Date: Tue, 17 Jan 2017 12:59:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
Subject: pyyaml for python 2 and 3 for morty
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
X-List-Received-Date: Tue, 17 Jan 2017 17:59:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

What are the chances of getting this into morty also? meta-xilinx need
the python3 version for something. They've added a local recipe to work
around the issue, but this would be a better long term solution.

https://patchwork.openembedded.org/patch/135639/

Philip

