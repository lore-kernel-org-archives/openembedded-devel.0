Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <majo.huber@googlemail.com>) id 1OLdoQ-00065i-IM
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 17:00:33 +0200
Received: by fxm9 with SMTP id 9so2252608fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jun 2010 07:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=z50Km5IvTzl3/QSuMbs+wmynyALcfSFsZU65MdHRYGo=;
	b=duBPjhLncRZrxtVWk3kUR5EfalH24yq+RFq+FyKM33sQOh4tsOpjYXuqJ2t47rFbvv
	/ejyehPjv6/YNfL3RlRt3KcepfI0DXQNx4j0JZ3+iUROeoIOgvhjVPyMW6l0i+ICu88k
	fRTz8W7rk0z9BUv6rDO+FvJdRxZFTSYbEtczg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=PaG/V18dvfDCdJ8NltZuqW8ggRzxpBDSXoUUsCgYf+TUadOeuTJ+h79vwavjcyGbjj
	srg5GLQS1/B5nH94oE+oZLbhY3znvoDifl9+zADa6bINg8p2DIL4BX08Ooh81ojUQ5uO
	EkQLd5FQm1pg3XQIn/UnguEngFpDtemtBN+iE=
MIME-Version: 1.0
Received: by 10.239.186.11 with SMTP id e11mr1006705hbh.20.1275922566714; Mon, 
	07 Jun 2010 07:56:06 -0700 (PDT)
Received: by 10.239.191.205 with HTTP; Mon, 7 Jun 2010 07:56:06 -0700 (PDT)
Date: Mon, 7 Jun 2010 16:56:06 +0200
Message-ID: <AANLkTimXv1jPzHaADkOFjcyT3zXHXYTMAugG0mtPBvWS@mail.gmail.com>
From: majo huber <majo.huber@googlemail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: majo.huber@googlemail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: new recipie for qt thumbwheel
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jun 2010 15:00:33 -0000
X-Groupsio-MsgNum: 19974
Content-Type: multipart/mixed; boundary=001485f44e865995bf048871dfb6

--001485f44e865995bf048871dfb6
Content-Type: text/plain; charset=ISO-8859-1

Hi@all,

we have made a new recipie for building the qt thumbwheel (a
touchscreen encoder wheel for the qt library).
I'd kindly request if anybody could push that to the dev branch.
I'd also suggest to put it in a separate directory e.g. called qt_addons.

Thanks,
majo

--001485f44e865995bf048871dfb6
Content-Type: application/octet-stream; 
	name="qt4-thumbwheel-opensource_2.4.bb"
Content-Disposition: attachment; filename="qt4-thumbwheel-opensource_2.4.bb"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ga5f99eu0

U0VDVElPTiA9ICJsaWJzIgpQUklPUklUWSA9ICJvcHRpb25hbCIKSE9NRVBBR0UgPSAiaHR0cDov
L3F0Lm5va2lhLmNvbS9kb3dubG9hZHMiCkxJQ0VOU0UgPSAiR1BMIExHUEwiCkRFUEVORFMgPSAi
cXQ0LWVtYmVkZGVkIgoKaW5oZXJpdCBxdDRlIGF1dG90b29scwoKUFIgPSAicjAiCgpTUkNfVVJJ
ID0gImZ0cDovL2Z0cC5xdC5ub2tpYS5jb20vcXQvc29sdXRpb25zL2xncGwvcXR0aHVtYndoZWVs
LTIuNC1vcGVuc291cmNlLnRhci5neiIKClMgPSAiJHtXT1JLRElSfS9xdHRodW1id2hlZWwtJHtQ
Vn0tb3BlbnNvdXJjZSIKCmRvX2NvbmZpZ3VyZSgpIHsKICBlY2hvIHllcyB8IC4vY29uZmlndXJl
IC1saWJyYXJ5CiAgJHtPRV9RTUFLRV9RTUFLRX0KfQoKZG9faW5zdGFsbCgpIHsKICBpbnN0YWxs
IC1kICR7RH0ke2xpYmRpcn0KICBpbnN0YWxsIC1tIDA3NTUgJHtTfS9saWIvbGliUXRTb2x1dGlv
bnNfVGh1bWJXaGVlbC0ke1BWfS5zby4xLjAuMCAke0R9JHtsaWJkaXJ9CiAgbG4gLXNmIGxpYlF0
U29sdXRpb25zX1RodW1iV2hlZWwtJHtQVn0uc28uMS4wLjAgJHtEfSR7bGliZGlyfS9saWJRdFNv
bHV0aW9uc19UaHVtYldoZWVsLSR7UFZ9LnNvLjEuMAogIGxuIC1zZiBsaWJRdFNvbHV0aW9uc19U
aHVtYldoZWVsLSR7UFZ9LnNvLjEuMC4wICR7RH0ke2xpYmRpcn0vbGliUXRTb2x1dGlvbnNfVGh1
bWJXaGVlbC0ke1BWfS5zby4xICAKICBsbiAtc2YgbGliUXRTb2x1dGlvbnNfVGh1bWJXaGVlbC0k
e1BWfS5zby4xLjAuMCAke0R9JHtsaWJkaXJ9L2xpYlF0U29sdXRpb25zX1RodW1iV2hlZWwtJHtQ
Vn0uc28gIAp9CgojQUxMT1dfRU1QVFkgPSAiIgpSREVQRU5EU18ke1BOfSA9ICJsaWJxdC1lbWJl
ZGRlZGd1aTQiCkZJTEVTXyR7UE59ID0gIiR7bGliZGlyfS9saWIqLnNvKiIKClNSQ19VUklbbWQ1
c3VtXSA9IDQ4NzY1YmIwZTA5YzBkMmU2ODZlY2E1OWNiMjMzZGY5ClNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJmYTMyMDhkZWVmNzE4ZWY3NmE5M2E4ZDQyMTg4MGU4OWM5YTg2ZjEwMDNhYzI4ZWQ2ZTM0
ZTM5M2YwNTQ0YmU3Igo=

--001485f44e865995bf048871dfb6--
