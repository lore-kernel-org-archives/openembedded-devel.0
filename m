Return-Path: <prvs=031b76774=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [80.120.57.43])
	by mail.openembedded.org (Postfix) with ESMTP id D07A36010B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 07:07:28 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2BGEQC5XbVX/0oKEKxehERZtUWEDIYdAoIwAgEBAQEBAnoLQQEBAwkChA4BBYEJCw0LLlcGDQgCFsRNAQEIJ4YqgXgIgk2Jfh0FmUSBZI8PARWHaxcMhVCGZ4VUg3iDGYE3gmaCUIFkfwEBAQ
X-IPAS-Result: A2BGEQC5XbVX/0oKEKxehERZtUWEDIYdAoIwAgEBAQEBAnoLQQEBAwkChA4BBYEJCw0LLlcGDQgCFsRNAQEIJ4YqgXgIgk2Jfh0FmUSBZI8PARWHaxcMhVCGZ4VUg3iDGYE3gmaCUIFkfwEBAQ
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <1465542922-21002-1-git-send-email-richard.leitner@skidata.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <2f93bc06-4a47-0833-78c2-1ea9f1ff1137@skidata.com>
Date: Thu, 18 Aug 2016 09:07:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <1465542922-21002-1-git-send-email-richard.leitner@skidata.com>
X-Originating-IP: [172.16.60.30]
X-ClientProxiedBy: sdex1srv.skidata.net (172.16.10.92) To sdex2srv.skidata.net
	(172.16.10.93)
Subject: Re: [meta-networking][jethro][backport][PATCH] samba: add volatile file to support readonly rootfs
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
X-List-Received-Date: Thu, 18 Aug 2016 07:07:30 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

any news or comments?

On 06/10/2016 09:15 AM, Richard Leitner wrote:
> This patch adds a volatile file for samba which was removed by the
> update from 3.6.25 to 4.1.12. This file is necessary to build a image
> that uses the read-only-rootfs feature.
> 
> Backported from master 12e31ce

