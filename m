Return-Path: <prvs=673fc8d93=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 43601734B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 07:04:25 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApwEALtk3VWsEApK/2dsb2JhbABdhFgGxg0CggQBAQEBAQGBC4QkAQEEMgFGEAsNCwklDwIQNgYNAQUCAogVAxfCUA2FNAEBAQEBBQEBAQEei1uCT4I7BxeEFQEElTeLBAGKZBeKE4c6hCZvgUiBBAEBAQ
X-IPAS-Result: ApwEALtk3VWsEApK/2dsb2JhbABdhFgGxg0CggQBAQEBAQGBC4QkAQEEMgFGEAsNCwklDwIQNgYNAQUCAogVAxfCUA2FNAEBAQEBBQEBAQEei1uCT4I7BxeEFQEElTeLBAGKZBeKE4c6hCZvgUiBBAEBAQ
Message-ID: <55DD64D5.60306@skidata.com>
Date: Wed, 26 Aug 2015 09:03:49 +0200
From: Richard Leitner <richard.leitner@skidata.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1440544569-21142-1-git-send-email-raj.khem@gmail.com>
	<1440544569-21142-2-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1440544569-21142-2-git-send-email-raj.khem@gmail.com>
X-Originating-IP: [172.16.60.30]
Subject: Re: [meta-java][PATCH 2/2] Revert "Don't depend on a hardcoded compiler"
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
X-List-Received-Date: Wed, 26 Aug 2015 07:04:26 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 08/26/2015 01:16 AM, Khem Raj wrote:
> This reverts commit 15ed9662e26ed4ac8d843fb9d2335a49a9c03088.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Thanks, this revert fixes my problems, so feel free to add:

Reviewed-by: Richard Leitner <richard.leitner@skidata.com>

